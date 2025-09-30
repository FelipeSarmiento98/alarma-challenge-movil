import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/devices_provider.dart';

import '../utils/responsive_app.dart';

import '../widgets/contacts_widgets/item_device_list.dart';

class DevicesPage extends StatefulWidget {
   
  const DevicesPage( { super.key } );

  @override
  State<DevicesPage> createState() => _DevicesPageState();

}

class _DevicesPageState extends State<DevicesPage> {

  @override
  Widget build( BuildContext context ) {

    final devicesProvider = Provider.of<DevicesProvider>( context );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFEFDE5),
              Color(0xFFFAFAEC),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric( horizontal: ResponsiveApp.dWidth( 16.0 ) ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: devicesProvider.lDevices.length,
                  itemBuilder: ( context, index ) => ItemDeviceList(
                    sName: devicesProvider.lDevices[index].sName!,
                    icon: devicesProvider.lDevices[index].sName!.contains('PC') ? Icons.computer : Icons.tv
                  )
                )
              )
            ]
          )
        ),
      ),
    );
  }
}