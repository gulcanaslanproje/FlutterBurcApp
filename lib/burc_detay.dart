import 'package:flutter/material.dart';
import 'package:flutter_burc_rehberi/burc_liste.dart';
import 'package:palette_generator/palette_generator.dart';
import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  BurcDetayState createState() {
    return new BurcDetayState();
  }
}

class BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    secilenBurc = BurcListesi.tumburclar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul() {
    Future<PaletteGenerator> fPaletGenerator =
    PaletteGenerator.fromImageProvider(
        AssetImage("images/" + secilenBurc.burcBuyukResim));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      debugPrint(
          "secilen renk :" + paletteGenerator.dominantColor.color.toString());

      setState(() {
        baskinRenk = paletteGenerator.dominantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              title: Text(secilenBurc.burcAdi + " Burcu ve Özellikleri"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: SingleChildScrollView(
                child: Text(secilenBurc.burcDetayi,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
