import 'dart:convert';
import 'package:demo_digitalin/core/app_style.dart';
import 'package:demo_digitalin/src/view/widget/PopUpPembayaran.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _Checkout createState() => _Checkout();
}

class _Checkout extends State<Checkout> {
  //_get berfungsi untuk menampung data dari internet nanti
  List _get = [];

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getData();
  }

  //method untuk merequest/mengambil data dari internet
  Future _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://localhost:5000/api/pembayaran"));

      // cek apakah respon berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'];

        setState(() {
          //memasukan data yang di dapat dari internet ke variabel _get
          _get = data;
          print(_get);
        });
      }
    } catch (e) {
      //tampilkan error di terminal
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //menghilangkan debug label
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          //membuat appbar dengan background putih dan membuat tulisan di tengah
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                "Orderan Kamu",
                style: h2Style,
              ),
            ),
          ),
          body: ListView.builder(
            // itemcount adalah total panjang data yang ingin ditampilkan
            // _get.length adalah total panjang data dari data berita yang diambil
            itemCount: _get.length,

            // itembuilder adalah bentuk widget yang akan ditampilkan, wajib menggunakan 2 parameter.
            itemBuilder: (context, index) {
              //padding digunakan untuk memberikan jarak bagian atas listtile agar tidak terlalu mepet
              //menggunakan edgeInsets.only untuk membuat jarak hanya pada bagian atas saja
              return Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),

                //listtile adalah widget yang disediakan flutter berisi 3 properti yang kita pakai
                //properti: leading, title, dan subtitle. di dalam setiap properti kalian bebas melakukan customisasi
                child: ListTile(
                  leading: Image.network(
                    //menampilkan data gamabr
                    _get[index]['urlToImage'] ??
                        "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg",
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                  title: Text(
                    //menampilkan data judul
                    _get[index]['nama_barang'] ?? "No Nama",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    //menampilkan deskripsi berita
                    _get[index]['response_midtrans']['transaction_status'] ??
                        "No Status",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Selesaikan pembayaran dengan:',
                        textAlign: TextAlign.center,
                      ),
                      content: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "ID-Order:\n" +
                                    _get[index]['id_order'] +
                                    "\n \n"),
                            TextSpan(
                                text: "Status Pembayaran:\n" +
                                    _get[index]['status'] +
                                    "\n \n"),
                            TextSpan(
                                text: "Nomor VA:\n" +
                                    _get[index]['response_midtrans']
                                        ['permata_va_number']),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
