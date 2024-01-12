import 'package:flutter/material.dart' hide FormState;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clases/flutter_bloc/form_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBloc(),
      child: const _ProviderView(),
    );
  }
}

class _ProviderView extends StatelessWidget {
  const _ProviderView();

  @override
  Widget build(BuildContext context) {
    print("******* Flutter Bloc *******");
    print("********************************");
    print("*---**********---***********---*");
    print("*************-----************");
    return BlocListener<FormBloc, FormState>(
      listener: (context, state) {
        if (state.email.isEmpty) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("El email no puede estar vacio"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Ok"),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nombre"),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  context.read<FormBloc>().add(FormNameChanged(value));
                },
              ),
              BlocBuilder<FormBloc, FormState>(
                buildWhen: (previous, current) => previous.name != current.name,
                builder: (context, state) {
                  print("State Name: $state");
                  return Text(
                    "Nombre ${state.name}",
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const Text("Email"),
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {
                  context.read<FormBloc>().add(FormEmailChanged(value));
                },
              ),
              BlocBuilder<FormBloc, FormState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  print("State Email: $state");
                  return Text(
                    "Email ${state.email}",
                  );
                },
              ),
              BlocSelector<FormBloc, FormState, String>(
                selector: (state) {
                  return state.email;
                },
                builder: (context, value) {
                  print("*******State Email Selector: $value");
                  return Text(
                    "Email selector $value",
                  );
                },
              ),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
