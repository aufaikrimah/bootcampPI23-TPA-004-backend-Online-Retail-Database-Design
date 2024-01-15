use OnlineRetail;

-- 1. Daftarkan Steven sebagai customer
INSERT INTO Pelanggan VALUES (11, 'Steven', 'steven@gmail.com', 'Jakarta');

-- 2. Steven memilih produk yang ingin dibeli
-- 2.a. Masukkan transaksi sebelum memasukkan detail transaksi
INSERT INTO Transaksi (TransaksiID, PelangganID, Tanggal, Jumlah)
VALUES (38, 11, '2024-01-22', 
        (SELECT SUM(B.Harga * DT.Jumlah) 
         FROM DetailTransaksi DT
         JOIN Barang B ON DT.BarangID = B.BarangID
         WHERE DT.TransaksiID = 37)
);
-- 2.b. Sekarang memasukkan detail transaksi
INSERT INTO DetailTransaksi VALUES (46, 38, 9, 1);       -- Powerbank
INSERT INTO DetailTransaksi VALUES (47, 38, 14, 1);      -- Summer Dress
INSERT INTO DetailTransaksi VALUES (48, 38, 56, 1);      -- Sunglasses

-- 3. Steven melakukan checkout
INSERT INTO Pengiriman VALUES (38, 38, 'J&T Express', 'Jakarta', 15000.00);  -- Assume shipping fee
INSERT INTO Pembayaran VALUES (32, 38, 'OVO',
        (SELECT Jumlah
         FROM Transaksi
         WHERE TransaksiID = 38),
        '2024-01-22');

-- 4. Melihat struk pembelian
SELECT 
    T.TransaksiID,
    T.Tanggal,
    P.Nama AS NamaPelanggan,
    B.NamaBarang,
    DT.Jumlah,
    B.Harga * DT.Jumlah AS TotalHarga,
    PG.MetodePengiriman,
    PG.AlamatPengiriman,
    PG.TarifPengiriman,
    PB.MetodePembayaran,
    PB.NominalPembayaran,
    PB.TanggalPembayaran
FROM 
    Transaksi T
JOIN 
    Pelanggan P ON T.PelangganID = P.PelangganID
JOIN 
    DetailTransaksi DT ON T.TransaksiID = DT.TransaksiID
JOIN 
    Barang B ON DT.BarangID = B.BarangID
JOIN 
    Pengiriman PG ON T.TransaksiID = PG.TransaksiID
JOIN 
    Pembayaran PB ON T.TransaksiID = PB.TransaksiID
WHERE
    T.TransaksiID = 38;