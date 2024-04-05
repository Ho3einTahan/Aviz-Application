
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../core/const/appColor.dart';
import '../widget/customButton.dart';
import '../widget/step-progress-indicator.dart';

class ChooseMapScreen extends StatefulWidget {
  const ChooseMapScreen({Key? key}) : super(key: key);

  @override
  State<ChooseMapScreen> createState() => _ChooseMapScreenState();
}

class _ChooseMapScreenState extends State<ChooseMapScreen> {
  late MapController _mapController = MapController();
  LatLng? _currentPosition; // Make _currentPosition nullable
  bool isRealyLocation = false;
  String addressName = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    final currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(
        currentPosition.latitude,
        currentPosition.longitude,
      );
      isLoading = false;
    });
    getAddressBy_Long_Lat(_currentPosition!.latitude.toString(),
        _currentPosition!.longitude.toString());
  }

  Future<void> getAddressBy_Long_Lat(String lat, String long) async {
    Response response = await Dio().get(
      'https://api.neshan.org/v5/reverse?lat=$lat&lng=$long',
      options: Options(
        headers: {
          'Api-Key': 'service.fa118e8276304266bd62784fd8ffee1d',
        },
      ),
    );

    if (response.statusCode == 200) {
      String? address = response.data['formatted_address'];
      addressName = address ?? '';
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 70,
          flexibleSpace: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: StepProgressIndicatorWidget(
                  currentStep: 4, context: context))),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              children: [
                const SizedBox(width: 16),
                FaIcon(FontAwesomeIcons.map, color: AppColor.primary),
                const SizedBox(width: 10),
                const Text('موقعیت مکانی'),
              ],
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                    'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.')),
            Container(
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (isLoading) ...[
                    CircularProgressIndicator(),
                  ] else ...[
                    FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: _currentPosition!,
                        initialZoom: 15,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        ),
                      ],
                    ),
                    showMapDetailScreen(addressName),
                  ],
                ],
              ),
            ),
            _FeatureItem(title: 'موقعیت دقیق نقشه نمایش داده شود؟'),
            const Spacer(),
            CustomButton(text: 'بعدی', onTap: () {}),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _FeatureItem({required String title}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isRealyLocation = !isRealyLocation;
        });
      },
      child: Container(
        padding: const EdgeInsets.only(right: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: const Color(0xffF2F4F7)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Switch(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                activeColor: Colors.white,
                activeTrackColor: AppColor.primary,
                inactiveTrackColor: AppColor.greyText,
                inactiveThumbColor: Colors.white,
                value: isRealyLocation,
                onChanged: (value) {
                  setState(() {
                    isRealyLocation = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget showMapDetailScreen(String address) {
  return Container(
    width: 250,
    height: 45,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
      ),
      onPressed: () {},
      child: Row(
        children: [
          Text(address,
              style: const TextStyle(overflow: TextOverflow.ellipsis)),
          const Spacer(),
          const FaIcon(Icons.location_on_outlined, size: 30),
        ],
      ),
    ),
  );
}
