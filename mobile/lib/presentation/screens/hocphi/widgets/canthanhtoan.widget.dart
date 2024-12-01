import 'package:flutter/material.dart';
import 'package:mobile/app/constants/app.colors.dart';
import 'package:mobile/app/constants/app.keys.dart';
import 'package:mobile/presentation/widgets/dimensions.widget.dart';

class CanThanhToan extends StatelessWidget {
  const CanThanhToan({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: h * 0.8,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                height: 70,
                child: Image.asset(
                  AppKeys.vietQR,
                  fit: BoxFit.contain,
                ),
              ),
              const Image(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6GCdKNHYdOz5dCaGMtGlIEFVn2NUL55-0cg&s"),
              ),
              vSizedBox1,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "napas",
                          style: TextStyle(
                              color: AppColors.bluedark,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const TextSpan(
                          text: '247',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                              color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                  hSizedBox1,
                  Container(
                    height: 20.0, // Height of the line
                    color: Colors.grey, // Color of the line
                    width:
                        2, // Makes it stretch across the width of the parent widget
                  ),
                  hSizedBox1,
                  const Text(
                    "ABC",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              vSizedBox1,
              RichText(
                text: TextSpan(
                  text: "Số tiền: ",
                  style: TextStyle(color: AppColors.bluedark, fontSize: 16),
                  children: const <TextSpan>[
                    TextSpan(
                      text: '6,000,000 VNĐ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              vSizedBox1,
              SizedBox(
                width: w * 0.6,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Nội dung CK: ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Thanh toan hoc phi nam hoc 2023 hoc ky 1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              vSizedBox1,
              Text(
                "Số TK: 2984738724",
                style: TextStyle(
                    color: AppColors.bluedark,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
