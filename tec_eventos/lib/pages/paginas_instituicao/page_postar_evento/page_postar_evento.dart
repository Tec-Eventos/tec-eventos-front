import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/events/domain/entities/app_event.dart';
import 'package:tec_eventos/features/events/presentation/providers/events_provider.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_postar_evento/input_text/data.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_postar_evento/input_text/hora.dart';
import 'package:tec_eventos/pages/paginas_instituicao/page_postar_evento/input_text/nome_evento.dart';
import 'package:tec_eventos/widgets/InputTextPostarEvento/ingressos.dart';
import 'package:tec_eventos/widgets/LocalEvent/local_event.dart';
import 'package:tec_eventos/widgets/gerarQrCodeButton/dialogQrCode/dialog_qrcode.dart';
import 'package:tec_eventos/utils/image_helper.dart';
import 'package:tec_eventos/utils/gerador_id_evento.dart';

/// Tela para cadastrar/postar um novo Evento por parte da Instituição.
///
/// Gerencia os campos locais, uploads de imagens (principal e logotipo) e integra-se
/// com o [createEventStateProvider] para registrar o evento.
class PagePostarEvento extends ConsumerStatefulWidget {
  /// Construtor padrão da tela.
  const PagePostarEvento({super.key});

  @override
  ConsumerState<PagePostarEvento> createState() => _PagePostarEventoState();
}

class _PagePostarEventoState extends ConsumerState<PagePostarEvento> {
  final _formfield = GlobalKey<FormState>();
  final _controllerDataEvento = TextEditingController();
  final _controllerHorarioEvento = TextEditingController();
  final _controllerNomeEvento = TextEditingController();
  final _controllerQntdIngresso = TextEditingController();
  final _controllerDescricaoEvento = TextEditingController();
  final _controllerCEPEvento = TextEditingController();
  final _controllerQrCode = TextEditingController();

  File? _imagePrincipal;
  File? _imageLogo;
  final _imageHelper = ImageHelper();

  @override
  void dispose() {
    _controllerDataEvento.dispose();
    _controllerHorarioEvento.dispose();
    _controllerNomeEvento.dispose();
    _controllerQntdIngresso.dispose();
    _controllerDescricaoEvento.dispose();
    _controllerCEPEvento.dispose();
    _controllerQrCode.dispose();
    super.dispose();
  }

  String _formatarData(String dataInput) {
    List<String> partes = dataInput.split('/');
    if (partes.length == 3) {
      return "${partes[2]}-${partes[1].padLeft(2, '0')}-${partes[0].padLeft(2, '0')}";
    }
    return dataInput;
  }

  String _formatarHora(String horaInput) {
    if (horaInput.contains('h')) {
      List<String> partes = horaInput.split('h');
      return "${partes[0].padLeft(2, '0')}:${partes[1].padRight(2, '0')}:00";
    }
    return horaInput;
  }

  Future<void> _handlePostar() async {
    if (!_formfield.currentState!.validate()) return;

    if (_imagePrincipal == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione a imagem principal do evento.')),
      );
      return;
    }

    if (_imageLogo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecione a imagem de logotipo do evento.')),
      );
      return;
    }

    final focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus) {
      focus.unfocus();
    }

    final auth = ref.read(authProvider).value;
    if (auth == null || !auth.isAuthenticated) return;

    final cdEvento = GeradorDeID().gerarIDUnico();
    final preco = 0.0; // Gratuito por padrão no fluxo legado

    final formattedDate = _formatarData(_controllerDataEvento.text);
    final formattedTime = _formatarHora(_controllerHorarioEvento.text);

    final event = AppEvent(
      cdEvento: cdEvento,
      nomeEvento: _controllerNomeEvento.text.trim(),
      cdInstituicao: auth.cdEscolar ?? 0,
      dataEvento: formattedDate,
      horario: formattedTime,
      quantidadeIngressos: int.tryParse(_controllerQntdIngresso.text.trim()) ?? 0,
      descricao: _controllerDescricaoEvento.text.trim(),
      cepEvento: _controllerCEPEvento.text.replaceAll("-", "").trim(),
      preco: preco,
      senhaEvento: '',
      instituicao: auth.name ?? '',
      tipoInstituicao: auth.userType,
      imagemEvento: '',
      logoEvento: '',
    );

    try {
      await ref.read(createEventStateProvider.notifier).submitEvent(
            event: event,
            imagePrincipal: _imagePrincipal!,
            imageLogo: _imageLogo!,
            qrCode: _controllerQrCode.text.trim(),
          );

      if (mounted) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          titleTextStyle: const TextStyle(fontFamily: Fontes.inter, fontWeight: FontWeight.w600),
          title: "Evento criado!",
          btnOkText: "Prosseguir",
          barrierColor: Cores.branco.withOpacity(0.7),
          btnOkOnPress: () {
            Navigator.pop(context);
          },
          btnOkColor: Cores.azul42A5F5,
        ).show();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao postar evento: ${e.toString().replaceAll('Failure: ', '')}'),
            backgroundColor: Cores.vermelho,
          ),
        );
      }
    }
  }

  Future<void> _pickImagePrincipal() async {
    final files = await _imageHelper.pickImage();
    if (files.isNotEmpty) {
      final cropped = await _imageHelper.crop(
        file: files.first,
        cropStyle: CropStyle.rectangle,
      );
      if (cropped != null) {
        setState(() {
          _imagePrincipal = File(cropped.path);
        });
      }
    }
  }

  Future<void> _pickImageLogo() async {
    final files = await _imageHelper.pickImage();
    if (files.isNotEmpty) {
      final cropped = await _imageHelper.crop(
        file: files.first,
        cropStyle: CropStyle.rectangle,
      );
      if (cropped != null) {
        setState(() {
          _imageLogo = File(cropped.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final createEventState = ref.watch(createEventStateProvider);
    final isLoading = createEventState is AsyncLoading;
    final displayHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: displayHeight / 3,
            flexibleSpace: FlexibleSpaceBar(
              background: _imagePrincipal != null
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: Image.file(_imagePrincipal!),
                    )
                  : Center(
                      child: ElevatedButton.icon(
                        onPressed: isLoading ? null : _pickImagePrincipal,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Cores.branco,
                          side: const BorderSide(color: Cores.preto),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.add, color: Cores.preto),
                        label: const Text(
                          'Imagem do Evento',
                          style: TextStyle(
                            color: Cores.preto,
                            fontFamily: Fontes.ralewayBold,
                          ),
                        ),
                      ),
                    ),
            ),
            floating: true,
            snap: true,
            pinned: true,
            elevation: 0,
            backgroundColor: Cores.branco,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Cores.preto,
              ),
            ),
            actions: [
              if (_imagePrincipal != null)
                IconButton(
                  onPressed: isLoading ? null : _pickImagePrincipal,
                  icon: const Icon(Icons.edit, size: 25, color: Cores.preto),
                ),
            ],
          ),
        ],
        body: Form(
          key: _formfield,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                shape: const Border(bottom: BorderSide(color: Cores.cinza)),
                style: ListTileStyle.drawer,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DataInput(controllerDataEvento: _controllerDataEvento),
                    const Text(
                      "às",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 18,
                        color: Cores.cinza6A6666,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    HoraInput(controllerHorario: _controllerHorarioEvento),
                  ],
                ),
                subtitle: NomeEventoInput(controllerNomeEvento: _controllerNomeEvento),
                trailing: SizedBox(
                  width: 108,
                  height: 36,
                  child: _imageLogo != null
                      ? Image.file(
                          _imageLogo!,
                          fit: BoxFit.contain,
                          width: 108,
                          height: 36,
                        )
                      : ElevatedButton.icon(
                          onPressed: isLoading ? null : _pickImageLogo,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Cores.branco,
                            elevation: 0,
                            side: const BorderSide(color: Cores.preto),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: const Icon(Icons.add, color: Cores.preto, size: 12),
                          label: const Text(
                            'Logo',
                            style: TextStyle(
                              color: Cores.preto,
                              fontSize: 11,
                              fontFamily: Fontes.ralewayBold,
                            ),
                          ),
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Informações do ingresso",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CaixaTextoIngressos(controllerIngressos: _controllerQntdIngresso),
                    ListTile(
                      leading: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundColor: Cores.azul42A5F5,
                          child: Icon(
                            Icons.payments_outlined,
                            color: Cores.branco,
                            size: 20,
                          ),
                        ),
                      ),
                      title: const Text(
                        "Gratuito",
                        style: TextStyle(
                          fontFamily: Fontes.raleway,
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Descrição",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _controllerDescricaoEvento,
                      maxLines: null,
                      enabled: !isLoading,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Coloque mais informações sobre o evento aqui",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Coloque a descrição do evento";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Local",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LocalEvent(controllerCEP: _controllerCEPEvento),
                    const SizedBox(height: 50),
                    const Text(
                      "Ingresso - QrCode",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "(Esse será o ingresso gerado para que você possa ter acesso ao evento.)",
                            style: TextStyle(
                              color: Cores.preto,
                              fontFamily: Fontes.raleway,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: InkWell(
                        onTap: isLoading
                            ? null
                            : () async {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return DialogQrCode(controllerQrCode: _controllerQrCode);
                                  },
                                );
                              },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 61,
                          decoration: BoxDecoration(
                            border: Border.all(color: Cores.azul42A5F5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 59,
                                height: 61,
                                decoration: const BoxDecoration(
                                  color: Cores.azul42A5F5,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.qr_code_2_outlined,
                                  color: Cores.branco,
                                  size: 33,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                "Gerar QRcode",
                                style: TextStyle(
                                  fontFamily: Fontes.ralewayBold,
                                  color: Cores.azul42A5F5,
                                  fontSize: 27,
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: isLoading ? null : _handlePostar,
        child: Container(
          height: 60,
          color: Cores.azul42A5F5,
          alignment: Alignment.center,
          child: isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
                  "POSTAR EVENTO",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: Fontes.ralewayBold,
                  ),
                ),
        ),
      ),
    );
  }
}
