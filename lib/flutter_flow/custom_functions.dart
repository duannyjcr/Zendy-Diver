import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool newCustomFunction2(String photoUrl) {
  return photoUrl.contains("https://lh3.googleusercontent.com");
}

String? renderCheckoutPaymentBrick(
  String userAuthenticatedId,
  double paymentAmount,
  String userEmail,
  String authToken,
  String deliveryId,
  String? mpCustomerId,
  String? mpCardId,
) {
  /*const String URL =
      "http://127.0.0.1:5001/zendy-ef8e9/us-central1/FirstPayment"; // prueba local*/
  const String URL =
      "https://firstpayment-wb7x4qhj6q-uc.a.run.app"; // produccion

  String html = '''
<html>

<head>
  <script src="https://sdk.mercadopago.com/js/v2"></script>
</head>

<body>

  <div id="cardPaymentBrick_container"></div>
  <div id="statusScreenBrick_container"></div>




  <script>

    const mp = new MercadoPago('TEST-d7161f9c-5118-4cd7-a537-b2504e03483d', { locale: 'es-UY' });

    const bricksBuilder = mp.bricks();

    /**
     * Renderiza el Brick de pago con tarjeta de cr dito
     * @param {BricksBuilder} bricksBuilder Instancia de la clase BricksBuilder
     * @returns {Promise<void>}
     */
    const renderCardPaymentBrick = async (bricksBuilder) => {
      const settings = {
        initialization: {
          amount: ${paymentAmount}, // monto a ser pago
          payer: {
            email: "${userEmail}",
          },
        },
        customization: {
          visual: {
            style: {
              theme: 'bootstrap', // | 'dark' | 'bootstrap' | 'flat'
              customVariables: {
                baseColor: "green"
              },
            },
          },
          paymentMethods: {
            maxInstallments: 1,
          },


        },
        callbacks: {
          onReady: () => {
            // callback llamado cuando Brick esté listo
          },
          onSubmit: (cardFormData) => {
            //  callback llamado cuando el usuario haga clic en el botón enviar los datos
            //  ejemplo de envío de los datos recolectados por el Brick a su servidor
            return new Promise((resolve, reject) => {
              fetch('${URL}', {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                  "Authorization": 'Bearer ${authToken}',
                },
                body: JSON.stringify({ ...cardFormData, metadata: { customerId: '${userAuthenticatedId}',  deliveryId: '${deliveryId}',  mp_customer_id: '${mpCustomerId}',  mp_card_Id: '${mpCardId}' } })
              })
                .then((response) => {
                  // recibir el resultado del pago
                  // destruir el formulario
                  window.cardPaymentBrickController.unmount();

                  response.json().then(async (datos) => {
                    // datos contiene la respuesta del servidor
                    // en este caso, el id del pago creado
                    console.log(datos);

                    const renderStatusScreenBrick = async (bricksBuilder) => {
                      const settings = {
                        initialization: {
                          paymentId: datos.paymentResponse.id, // Payment identifier, from which the status will be checked
                        },
                        customization: {
                          visual: {
                            hideStatusDetails: false,
                            hideTransactionDate: false,
                            showExternalReference: true,
                            style: {
                              theme: 'bootstrap',
                              baseColor: "green", // 'default' | 'dark' | 'bootstrap' | 'flat'
                            },
                          },
                          backUrls: {
                            // 'error': '<http://<your domain>/error>',
                            // 'return': 'http://<your domain>/homepage'
                          }
                        },
                        callbacks: {
                          onReady: () => {
                            // Callback called when Brick is ready
                          },
                          onError: (error) => {
                            // Callback called for all Brick error cases
                            console.log(error);
                          },
                        },
                      };
                      window.statusScreenBrickController = await bricksBuilder.create('statusScreen', 'statusScreenBrick_container', settings);
                    };
                    renderStatusScreenBrick(bricksBuilder);

                  });


                  resolve();
                })
                .catch((error) => {
                  // tratar respuesta de error al intentar crear el pago
                  console.log(error);
                  reject();
                })
            });
          },
          onError: (error) => {
            // callback llamado para todos los casos de error de Brick
          },
        },
      };
      window.cardPaymentBrickController = await bricksBuilder.create('cardPayment', 'cardPaymentBrick_container', settings);
    };
    renderCardPaymentBrick(bricksBuilder);
  </script>


</body>

</html>
''';
  ;

  return html;
}

String convertirMinutosAHoras(String segundosStr) {
  // Parseo seguro
  final double segundos = double.tryParse(segundosStr) ?? 0.0;

  // Pasar a minutos redondeando
  final int totalMin = (segundos / 60).round();

  final int horas = totalMin ~/ 60;
  final int mins = totalMin % 60;

  if (horas > 0) {
    return "${horas.toString().padLeft(2, '0')} h ${mins.toString().padLeft(2, '0')} min";
  }
  return "$totalMin min";
}

String convertirMetrosAKm(String metrosStr) {
  // Convertir el string a double
  double metros = double.tryParse(metrosStr) ?? 0;

  // Pasar a km
  double km = metros / 1000;

  // Redondear a 2 decimales
  return "${km.toStringAsFixed(2)} km";
}

double calculatePrice(int listStops) {
  double price = 0;
  if (listStops <= 3) {
    price = listStops * 150;
  } else {
    price = listStops * 130;
  }
  return price;
}
