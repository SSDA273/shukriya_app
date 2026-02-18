import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/core/api/gieom/get_gieom_instructions_api.dart';
import 'gieom_token_notifier.dart';

class GetGieomInstructionNotifier extends ChangeNotifier {
  final GetGieomInstructionsAPI _gieomInstructionsAPI = GetGieomInstructionsAPI();
  Map<String, dynamic>? _instructionData;

  Map<String, dynamic>? get getGieomInstruction=>_instructionData;

  Future<void> getDetails({
    required BuildContext context,
  }) async {
    try {
      final userToken=context.read<GieomTokenNotifier>().getGieomToken;

      final data = await _gieomInstructionsAPI.getInstructions(userId: userToken ?? "MOCK-TOKEN");
      final message = data['message'];
      if(message == 'Success'){
        _instructionData = data['result'];
        notifyListeners();
      }
    } catch(error){
      // Provide dummy instructions for demo purposes if API fails
      _instructionData = {
        "status": "Success",
        "instructions": "Please verify your details below."
      };
      print("Gieom Instruction API Failed. Using Mock Data for demo.");
      notifyListeners();
    }
  }
}
