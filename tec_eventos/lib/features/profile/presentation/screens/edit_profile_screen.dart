import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tec_eventos/core/auth/auth_provider.dart';
import 'package:tec_eventos/core/auth/auth_state.dart';
import 'package:tec_eventos/core/theme/cores.dart';
import 'package:tec_eventos/core/theme/fontes.dart';
import 'package:tec_eventos/features/profile/domain/entities/user_profile.dart';
import 'package:tec_eventos/features/profile/presentation/providers/profile_provider.dart';
import 'package:tec_eventos/features/profile/presentation/widgets/text_form_field_edit_user.dart';

/// Tela para edição dos dados cadastrais do perfil do usuário.
///
/// Permite atualizar foto de perfil (Galeria/Câmera e Recorte), nome, telefone,
/// e-mail, identificação, instituição escolar e localização. Persiste as alterações no Riverpod.
class EditProfileUser extends ConsumerStatefulWidget {
  /// Construtor da tela de edição de perfil.
  const EditProfileUser({Key? key}) : super(key: key);

  @override
  ConsumerState<EditProfileUser> createState() => _EditProfileUserState();
}

class _EditProfileUserState extends ConsumerState<EditProfileUser> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _codeController;
  late TextEditingController _instController;
  late TextEditingController _cityController;
  late TextEditingController _professionController;

  File? _imagePerfil;
  bool _initialized = false;
  final _picker = ImagePicker();

  void _initializeControllers(UserProfile profile) {
    if (_initialized) return;

    _nameController = TextEditingController(text: profile.name);
    _phoneController = TextEditingController(text: profile.phone);
    _emailController = TextEditingController(text: profile.email);
    _codeController = TextEditingController(text: profile.identificationCode);
    _instController = TextEditingController(text: profile.institutionName);
    _cityController = TextEditingController(text: profile.city);
    _professionController = TextEditingController(text: profile.profession);

    if (!profile.avatarUrl.startsWith('assets/')) {
      _imagePerfil = File(profile.avatarUrl);
    }

    _initialized = true;
  }

  @override
  void dispose() {
    if (_initialized) {
      _nameController.dispose();
      _phoneController.dispose();
      _emailController.dispose();
      _codeController.dispose();
      _instController.dispose();
      _cityController.dispose();
      _professionController.dispose();
    }
    super.dispose();
  }

  ImageProvider _getAvatarImage(String defaultAsset) {
    if (_imagePerfil != null) {
      return FileImage(_imagePerfil!);
    }
    return AssetImage(defaultAsset);
  }

  Future<void> _save(UserProfile currentProfile) async {
    final updated = currentProfile.copyWith(
      name: _nameController.text,
      phone: _phoneController.text,
      email: _emailController.text,
      identificationCode: _codeController.text,
      institutionName: _instController.text,
      city: _cityController.text,
      profession: _professionController.text,
      avatarUrl: _imagePerfil != null ? _imagePerfil!.path : currentProfile.avatarUrl,
    );

    // Salva o perfil no Riverpod
    await ref.read(profileProvider.notifier).saveProfile(updated);

    // Sincroniza temporariamente a nova sessão no authProvider legável
    final prefs = await SharedPreferences.getInstance();
    final userType = prefs.getString('userType') ?? 'Aluno';

    final intCode = int.tryParse(updated.identificationCode.replaceAll(RegExp(r'\D'), ''));

    await ref.read(authProvider.notifier).updateSession(
          AuthState(
            name: updated.name,
            email: updated.email,
            rm: userType == 'Aluno' ? intCode : null,
            cdEscolar: userType == 'Instituição' ? intCode : null,
            userType: userType,
          ),
        );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perfil atualizado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);

    return profileState.when(
      data: (profile) {
        _initializeControllers(profile);
        return Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: const Color(0xffE3F2FD),
                automaticallyImplyLeading: false,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Cores.preto,
                    size: 27,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text(
                  "Editar Perfil",
                  style: TextStyle(
                    fontFamily: Fontes.ralewayBold,
                    color: Cores.preto,
                    fontSize: 22,
                  ),
                ),
                centerTitle: true,
                actions: [
                  TextButton(
                    onPressed: () => _save(profile),
                    child: const Text(
                      "SALVAR",
                      style: TextStyle(
                        fontFamily: Fontes.raleway,
                        color: Cores.preto,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              ),
            ],
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/perfilcima.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 13),
                                    child: SizedBox(
                                      height: 130,
                                      width: 130,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: Image(
                                          image: _getAvatarImage(profile.avatarUrl),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 12,
                                    right: 0,
                                    child: Container(
                                      width: 42,
                                      height: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: const Color(0xffEBEBEB),
                                      ),
                                      child: IconButton(
                                        onPressed: () async {
                                          Map<Permission, PermissionStatus> statuses = await [
                                            Permission.storage,
                                            Permission.camera,
                                          ].request();
                                          if (statuses[Permission.storage]!.isGranted &&
                                              statuses[Permission.camera]!.isGranted) {
                                            _showImagePicker();
                                          } else {
                                            // Se for iOS ou Android com novas APIs de fotos
                                            _showImagePicker();
                                          }
                                        },
                                        icon: const Icon(Icons.photo_camera_outlined),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      Text(
                        _nameController.text,
                        style: const TextStyle(
                          fontFamily: Fontes.raleway,
                          color: Cores.preto,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        _professionController.text,
                        style: const TextStyle(
                          fontFamily: Fontes.raleway,
                          color: Cores.preto,
                          fontSize: 16,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  TextFFEditUser(
                    controller: _nameController,
                    labelText: "Nome do Usuário",
                    iconeInicio: const Icon(Icons.person_outline, size: 17),
                    keyBoardType: TextInputType.text,
                  ),
                  TextFFEditUser(
                    controller: _professionController,
                    labelText: "Profissão / Atuação",
                    iconeInicio: const Icon(Icons.work_outline, size: 17),
                    keyBoardType: TextInputType.text,
                  ),
                  TextFFEditUser(
                    controller: _phoneController,
                    labelText: "Telefone de contato",
                    iconeInicio: const Icon(Icons.call_outlined, size: 17),
                    keyBoardType: TextInputType.phone,
                  ),
                  TextFFEditUser(
                    controller: _emailController,
                    labelText: "E-mail de contato",
                    iconeInicio: const Icon(Icons.email_outlined, size: 17),
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  TextFFEditUser(
                    controller: _codeController,
                    labelText: "Código de Identificação (RM)",
                    iconeInicio: const Icon(Icons.qr_code_2, size: 17),
                    keyBoardType: TextInputType.text,
                  ),
                  TextFFEditUser(
                    controller: _instController,
                    labelText: "Instituição de Ensino",
                    iconeInicio: const Icon(Icons.school_outlined, size: 17),
                    keyBoardType: TextInputType.text,
                  ),
                  TextFFEditUser(
                    controller: _cityController,
                    labelText: "Cidade, Estado",
                    iconeInicio: const Icon(Icons.location_on_outlined, size: 17),
                    keyBoardType: TextInputType.text,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Erro: $e'))),
    );
  }

  void _showImagePicker() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (builder) {
        return SingleChildScrollView(
          child: Card(
            elevation: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: const Text(
                          "Foto de perfil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      _imgFromGallery();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: Color(0xffE3F2FD),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 25,
                              color: Color(0xff1565C0),
                            ),
                          ),
                          const SizedBox(width: 32),
                          const Text(
                            "Ir à galeria",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 21),
                  InkWell(
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            decoration: const BoxDecoration(
                              color: Color(0xffE3F2FD),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add_a_photo_outlined,
                              size: 25,
                              color: Color(0xff1565C0),
                            ),
                          ),
                          const SizedBox(width: 32),
                          const Text(
                            "Tirar uma foto agora",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _imgFromGallery() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (pickedFile != null) {
        _cropImage(File(pickedFile.path));
      }
    } catch (e) {
      debugPrint("Erro galeria: $e");
    }
  }

  Future<void> _imgFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      if (pickedFile != null) {
        _cropImage(File(pickedFile.path));
      }
    } catch (e) {
      debugPrint("Erro camera: $e");
    }
  }

  Future<void> _cropImage(File imgFile) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Tec!Eventos",
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
          ),
          IOSUiSettings(
            title: "Tec!Eventos",
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _imagePerfil = File(croppedFile.path);
        });
      }
    } catch (e) {
      debugPrint("Erro crop: $e");
    }
  }
}
