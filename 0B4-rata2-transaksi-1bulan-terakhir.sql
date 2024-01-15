use OnlineRetail;

SELECT AVG(Jumlah) as RataRataTransaksi
FROM Transaksi
WHERE Tanggal BETWEEN '2024-01-01' AND '2024-01-31';