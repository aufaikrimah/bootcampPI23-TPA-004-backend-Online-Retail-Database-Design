use OnlineRetail;

SELECT KategoriID, COUNT(BarangID) as JumlahBarang
FROM Barang
GROUP BY KategoriID
ORDER BY JumlahBarang DESC
LIMIT 1;