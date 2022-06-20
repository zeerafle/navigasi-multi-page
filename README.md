Nama : Vauwez Sam El Fareez

NIM : 2009106054

Tugas UAS mata kuliah pemrograman mobile

# Badge Bootcamp Belajar Android

| Bahasan | Badge |
| --- | --- |
| [Introduction to Kotlin](https://developers.google.com/profile/badges/playlists/android/android-basics-kotlin-pathway-one) | ![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/introduction_to_kotlin.png) |
| [First App in Android Studio](https://developers.google.com/profile/badges/playlists/android/android-basics-kotlin-pathway-two) | ![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/first_app_in_android_studio.png) |
| [Build a Basic Layout](https://developers.google.com/profile/badges/playlists/android/android-basics-kotlin-pathway-three) | ![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/build_a_basic_layout.png) |

# Tugas

## Navigasi

`main.dart`
```dart
    ...
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/main': (context) => const MainPage(),
        '/form': (context) => FormPage(),
        '/booking': (context) => BookingPage(),
        ...
```

Salah satu navigasi di halaman utama menuju halaman formulir.

```dart
                ...
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                ...
```

## List View

List view diterapkan di semua halaman. Contoh di halaman utama.

```dart
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          children: [
            const Text(
              "Halo, Vauwez Sam El Fareez",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Temukan Doktermu",
              style: TextStyle(fontSize: 27),
            ),
            const SizedBox(
              height: 27,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  disabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xffa8c686), width: 1)),
                  hintText: "Cari dokter",
                  hintStyle: const TextStyle(fontFamily: "PoppinsRegular"),
                  prefixIcon: const Icon(Icons.search)),
            ),
```

## Card View

Card view digunakan di halaman utama untuk membuat kartu klinik dan dokter umum.

![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/cardview.png)

```dart
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Card(
                  color: const Color(0xffa8c686),
                  margin: const EdgeInsets.only(right: 6),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xffa8c686))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.medication,
                          color: Colors.white,
                          size: 45,
                        ),
                        Text(
                          "Klinik",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                )),
                Expanded(
                    child: Card(
                  color: const Color(0xff9d9c62),
                  margin: const EdgeInsets.only(left: 6),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xff9d9c62))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.health_and_safety,
                          color: Colors.white,
                          size: 45,
                        ),
                        Text(
                          "Dokter umum",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                )),
              ],
            )
```

## Snackbar

Snackbar digunakan sebagai pesan notifikasi bahwa antrian berhasil dibooking.

![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/snackbar.png)

```dart
                const mySnackBar = SnackBar(
                    content: Text("Antrian di booking!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "PoppinsBold")),
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Color(0xffe4572e));
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
```

## API

API yang digunakan API dari [Firebase](https://firebase.google.com/)

### GET

Mengambil data antrian yang sudah dibooking. Data ini ditampilkan pada halaman daftar booking antrian.

![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/booking_page.png)

```dart
  ...
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference bookingStore = firestore.collection("booking");

    return Scaffold(
    ...
                // READ DATA
                StreamBuilder<QuerySnapshot>(
                    stream: bookingStore.snapshots(),
                    builder: (_, snapshot) {
                      return (snapshot.hasData)
                          ? Column(
                              children: snapshot.data!.docs
                                  .map(
                                    (e) => ContainerBooking(
                                        nama: e.get("nama"),
                                        docId: e.id,
                                        onDelete: () {
                                          bookingStore.doc(e.id).delete();
                                        }),
                                  )
                                  .toList(),
                            )
                          : const Text("Sabar ...");
                    })
                    ...
```

### POST

Proses tambah data terjadi saat menekan tombol antri sekarang pada halaman form

![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/form_page.png)

```dart
                ...
                // ADD DATA
                FirebaseFirestore.instance.collection("booking").add({
                  "nama": tc.nama.value,
                  "umur": tc.umur.value,
                  "alamat": tc.alamat.value,
                  "bpjs": tc.bpjs.value,
                  "alergiObat": tc.alergiObat.value,
                  "keluhan": tc.keluhan.value,
                });
                ...
```

### UPDATE

Proses perbarui data ada di halaman detail booking. Halaman detail booking didapat dari menekan salah satu dari daftar antrian terbooking di halaman daftar booking antrian

![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/rincian_booking.png)

```dart
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference bookingStore = firestore.collection("booking");

    Future<void> getData() async {
      DocumentSnapshot document = await bookingStore.doc(docId).get();
      tc.namaController.text = document.get("nama");
      tc.umurController.text = document.get('umur');
      tc.alamatController.text = document.get('alamat');
      tc.bpjsController.text = document.get('bpjs');
      tc.alergiObatController.text = document.get('alergiObat');
      tc.keluhanController.text = document.get('keluhan');
      tc.dokter.value = document.get('dokter');
      tc.sisaAntrian.value = document.get('sisaAntrian');
    }
```

### DELETE

Proses hapus data ada dihalaman daftar booking antrian dengan menekan tombol icon batalkan pada salah satu container antrian terbooking

![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/cancel_button.png)

![](https://raw.githubusercontent.com/zeerafle/navigasi-multi-page/master/screenshot/booking_page_delete_entry.png)

```dart
                ...
                StreamBuilder<QuerySnapshot>(
                                        ...
                                        nama: e.get("nama"),
                                        docId: e.id,
                                        onDelete: () {
                                          bookingStore.doc(e.id).delete();
                                        }),
                    ...
                    })
                    ...
```
