use OnlineRetail;

CREATE TABLE Pelanggan (
    PelangganID INT PRIMARY KEY,
    Nama VARCHAR(255),
    Email VARCHAR(255),
    Alamat VARCHAR(255)
);

CREATE TABLE Barang (
    BarangID INT PRIMARY KEY,
    NamaBarang VARCHAR(255),
    Harga DECIMAL(10,2),
    KategoriID INT,
    FOREIGN KEY (KategoriID) REFERENCES Kategori(KategoriID)
);

CREATE TABLE Transaksi (
    TransaksiID INT PRIMARY KEY,
    PelangganID INT,
    Tanggal DATE,
    Jumlah DECIMAL(10,2),
    FOREIGN KEY (PelangganID) REFERENCES Pelanggan(PelangganID)
);

CREATE TABLE DetailTransaksi (
    DetailTransaksiID INT PRIMARY KEY,
    TransaksiID INT,
    BarangID INT,
    Jumlah INT,
    FOREIGN KEY (TransaksiID) REFERENCES Transaksi(TransaksiID),
    FOREIGN KEY (BarangID) REFERENCES Barang(BarangID)
);

CREATE TABLE Kategori (
    KategoriID INT PRIMARY KEY,
    NamaKategori VARCHAR(255)
);

CREATE TABLE Pengiriman (
    PengirimanID INT PRIMARY KEY,
    TransaksiID INT,
    MetodePengiriman VARCHAR(255),
    AlamatPengiriman VARCHAR(255),
    TarifPengiriman DECIMAL(10,2),
    FOREIGN KEY (TransaksiID) REFERENCES Transaksi(TransaksiID)
);

CREATE TABLE Pembayaran (
    PembayaranID INT PRIMARY KEY,
    TransaksiID INT,
    MetodePembayaran VARCHAR(255),
    NominalPembayaran DECIMAL(10,2),
    TanggalPembayaran DATE,
    FOREIGN KEY (TransaksiID) REFERENCES Transaksi(TransaksiID)
);