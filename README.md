Sesudah melakukan import terhadap database, jalankan query ini untuk membuat table view ranking

create view ranking as SELECT siswa.name, sum(kas.pekan1+kas.pekan2+kas.pekan3+kas.pekan4) as total, dense_rank() OVER ( partition by kas.bulan order by total desc )  AS "RANKING" FROM kas inner join siswa on kas.nis = siswa.nis group by kas.nis order by ranking asc;
