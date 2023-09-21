import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFFEditUser extends StatefulWidget {
  final String conteudoCampo;
  final Icon iconeInicio;
  final TextInputType keyBoardType;
    final List<TextInputFormatter>? inputFormatters;

  const TextFFEditUser({
    required this.conteudoCampo, required this.iconeInicio, required this.keyBoardType, this.inputFormatters
  });

  @override
  State<TextFFEditUser> createState() => _TextFFEditUserState();
}

class _TextFFEditUserState extends State<TextFFEditUser> {

  TextEditingController _textEditingController = TextEditingController();
  bool _isActivated = false;

  @override
  void dispose(){
   _textEditingController.dispose();
   super.dispose();
  }

  void _campoHabilitado(){
    setState(() {
      _isActivated = true;
    });
  }

  void _campoNaoHabilitado(){
    setState(() {
      _isActivated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.sizeOf(context).width/1.1,
        height: 40,
        color: Colors.transparent,
        child:  Stack(
          alignment: Alignment.centerRight,
          children:[
            IgnorePointer(
              ignoring: !_isActivated,
              child: TextFormField(
                keyboardType: widget.keyBoardType,
                inputFormatters: widget.inputFormatters,
                controller: _textEditingController,
                enabled: _isActivated,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(widget.iconeInicio.icon, color: Colors.black,),
                  hintText: widget.conteudoCampo,
                  hintStyle: TextStyle(
                    color: Color(0xff989494),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            AbsorbPointer(
              absorbing: false,
              child: IconButton(
                onPressed: (){
                  if(_isActivated){
                    _campoNaoHabilitado();
                  }else{
                    _campoHabilitado();
                  }
                },
                icon: Icon(Icons.edit_outlined, size: 20,),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
