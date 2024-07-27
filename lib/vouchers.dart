import 'package:flutter/material.dart';

class Voucher {
  final String code;
  final String description;
  final double discount;
  final String imageUrl;

  Voucher({
    required this.code,
    required this.description,
    required this.discount,
    required this.imageUrl,
  });
}

class VoucherList extends StatefulWidget {
  @override
  _VoucherListState createState() => _VoucherListState();
}

class _VoucherListState extends State<VoucherList> {
  List<Voucher> vouchers = [
    Voucher(
      code: 'SAVE10',
      description: 'Flat ₹500 off on orders above ₹1200',
      discount: 500,
      imageUrl:
          'https://erpcinrmcdn.easyrewardz.com/rm-assets/Flat500Offonordersabove1200onjustherbscreative.jpg',
    ),
    Voucher(
      code: 'SAVE20',
      description: 'Flat up to 40% off on all your orders',
      discount: 400,
      imageUrl:
          'https://cdn.zoutons.com/images/originals/blog/main-banner_1693226026.png',
    ),
    Voucher(
      code: 'SAVE30',
      description: '5% cashback on any gift card purchase',
      discount: 50,
      imageUrl:
          'https://4.bp.blogspot.com/-dCa6CSuvrrE/Vu57QTG5BLI/AAAAAAAAOA4/Y4ctrqheq28S_0nhVa9zbU_EH0zzHOJjA/s1600/flipkart-the-perfect-gift-5-cashback-on-gift-cards.png',
    ),
    Voucher(
      code: 'SAVE40',
      description: '₹4 - ₹15 cashback on first mobile recharge',
      discount: 15,
      imageUrl:
          'https://offercdn.paytm.com/blog/2020/01/App-Landing-Jio-Recharge-1.jpg',
    ),
    Voucher(
      code: 'SAVE50',
      description: 'Flat upto ₹200 off on Add Money to Your Wallet',
      discount: 200,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUCqulzdkyXah7GxPloHTPzX1lN3BPrmydYXo8P4kN1jZ-txhwJ46_gSVIYgM1r4VyqEc&usqp=CAU',
    ),
    Voucher(
      code: 'SAVE50',
      description: 'Flat ₹100 off on boat ear Buds on order above ₹1500',
      discount: 100,
      imageUrl:
          'https://cdn.grabon.in/gograbon/images/merchant/1697612783715.jpg',
    ),
    Voucher(
      code: 'SAVE50',
      description: 'Flat ₹1000 off on Premium Eyeglasses for Gold Members',
      discount: 1000,
      imageUrl:
          'https://cdn.grabon.in/gograbon/images/merchant/1610441177996.png',
    ),
    Voucher(
      code: 'SAVE50',
      description: 'Flat upto ₹500 off on Bus tickets',
      discount: 500,
      imageUrl: 'https://i.ytimg.com/vi/Yat5QbVpDuc/maxresdefault.jpg',
    ),
  ];

  void _redeemVoucher(Voucher voucher) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Voucher Redeemed'),
          content: Text('You have redeemed: ${voucher.description}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Your Rewards',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 236, 235, 232),
          ),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.76,
            //crossAxisSpacing: 0.0,
            mainAxisSpacing: 14.0,
          ),
          itemCount: vouchers.length,
          itemBuilder: (context, index) {
            final voucher = vouchers[index];

            return GestureDetector(
              onTap: () => _redeemVoucher(voucher),
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12.0),
                      ),
                      child: Image.network(
                        voucher.imageUrl,
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            voucher.code,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(voucher.description),
                          SizedBox(height: 8.0),
                          Text(
                            '₹${voucher.discount} off',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
