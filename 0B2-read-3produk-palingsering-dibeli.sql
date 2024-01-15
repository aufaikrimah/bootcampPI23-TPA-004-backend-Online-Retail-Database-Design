use OnlineRetail;

SELECT BarangID, COUNT(BarangID) as JumlahPembelian
FROM DetailTransaksi
GROUP BY BarangID
ORDER BY JumlahPembelian DESC
LIMIT 3;