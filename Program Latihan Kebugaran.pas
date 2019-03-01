program latihankebugaran;

uses crt;

{Deklarasi Tipe Data Bentukan}

type 
	waktu = record
	tgl, bln, thn : integer;
end;

type
	kekuatan = record
	JumPU, JumSU : integer;
end;

type
	kelincahan = record
	WakZZ, WakJB : integer;
end;

type
	kecepatan = record
	WakLC, JarLC, WakSS, JumSS : integer;
end;

type
	harian = record
	dwaktu : waktu;
	dkekuatan : kekuatan;
	dkelincahan : kelincahan;
	dkecepatan : kecepatan;
end;

type
	datawaktu = record
	mingguan : array[1..7] of harian;

	{Array Yang Lainnya Ada Didalam Procedure, Sebagai Array Lokal}
end;

{Deklarasi Label}

label
    utama, pertanyaan;

{Deklarasi Variabel}

var
	
	A, B : datawaktu;
	i, n, c  : integer;
	m : string;

	{Deklarasi Function}

	{Function Untuk Konversi Detik Ke Menit}
	function konversi(n : integer):real;
	var
		simpan1,simpan2 : integer;
		simpan3,hasil : real;

	begin
		simpan1 := n mod 60;
	    simpan2 := n div 60;
	    simpan3 := simpan1 / 60;
	    hasil   := simpan2 + simpan3;

	    konversi := hasil;
	end;

	{Function Untuk Mencari Kecepatan}
	function rumus(jarak, waktu : integer):real;
	begin
		rumus := jarak / waktu;
	end;

	{Deklarasi Procedure}

	{Procedure Untuk Menginputkan Tanggal Latihan}
	procedure insert_tanggal(var A : datawaktu; i : integer);
	label
		kesini_tanggal;

	var
		c : integer;

	begin

		writeln('Contoh Inputan :');
		writeln('----------------');
		writeln('Tanggal = 11');
		writeln('Bulan   = 05');
		writeln('Tahun   = 16');
		writeln;
		writeln('Dilakukan Pada :');
		writeln('----------------');

		kesini_tanggal:
		write  ('Tanggal = '); readln(A.mingguan[i].dwaktu.tgl);

		{Kondisi dimana jika tanggal yang user inputkan sama, maka program akan meminta user untuk menginputkan tanggal lagi}

		if (i <> 1) then begin {Khusus untuk tanggal yang diinputkan pertama kali, program tidak akan melakukan Check}
			for c:=1 to i-1 do begin
				if (A.mingguan[i].dwaktu.tgl = A.mingguan[c].dwaktu.tgl) then begin
					writeln('Peringatan : Latihan pada tanggal ',A.mingguan[i].dwaktu.tgl,' sudah dilakukan!');
                   	writeln;
                    goto kesini_tanggal;
                end;
            end;
        end;

		write  ('Bulan   = '); readln(A.mingguan[i].dwaktu.bln);
		write  ('Tahun   = '); readln(A.mingguan[i].dwaktu.thn);

	end;

	{Procedure Untuk Menginputkan Latihan}
	procedure insert_latihan(var A : datawaktu; i : integer);
	label
		kesini_latihan1, kesini_latihan2, kesini_latihan3, kesini_latihan4;

	var
		c1 : integer;
		c2, c3, c4 : string;

	begin

		kesini_latihan1:
        clrscr;
        writeln('Catatan : Jika menginputkan lebih dari 1x dalam hari yang sama');
        writeln('          maka inputan yang terakhirlah yang akan disimpan');
        writeln;
        writeln('====================[ PILIH JENIS LATIHAN ]===================');
        writeln;
        writeln('1.Latihan Kekuatan (Strenght)');
        writeln('2.Latihan Kelincahan (Agility)');
        writeln('3.Latihan Kecepatan (Speed)');
        writeln;
        write  ('Pilih Menu ke = ');
        readln (c1);

        {Kondisi}

        if (c1=1) then begin

        	clrscr;
            writeln('>>>>>>>>>>>> [ LATIHAN KEKUATAN ] <<<<<<<<<<<<');
            writeln;
            writeln('1.Push Up');
            write  ('  Dilakukan sebanyak = ');
            readln (A.mingguan[i].dkekuatan.jumPU);
            writeln;
            writeln('2.Sit Up');
            write  ('  Dilakukan sebanyak = ');
            readln (A.mingguan[i].dkekuatan.jumSU);
            writeln;
            writeln('----------------------------------------------');

            kesini_latihan2:
            write  ('Ingin melakukan latihan yang lainnya (y/n) ? ');
            readln(c2);

            {Kondisi}

            if (c2='y') then begin
            	goto kesini_latihan1;
            end

            else if (c2='n') then begin
            	exit;
            end

            else begin
            	goto kesini_latihan2;
            end;

        end

        else if (c1=2) then begin

            clrscr;
            writeln('>>>>>>>>>>> [ LATIHAN KELINCAHAN ] <<<<<<<<<<<');
            writeln;
            writeln('1.Lari ZigZag');
            write  ('  Dilakukan selama (detik) = ');
            readln (A.mingguan[i].dkelincahan.wakZZ);

            writeln('  Setara dengan = ',konversi(A.mingguan[i].dkelincahan.wakZZ):0:2,' Menit');

            writeln;
            writeln('2.Jongkok-Berdiri');
            write  ('  Dilakukan selama (detik) = ');
            readln (A.mingguan[i].dkelincahan.wakJB);

            writeln('  Setara dengan = ',konversi(A.mingguan[i].dkelincahan.wakJB):0:2,' Menit');

            writeln;
            writeln('----------------------------------------------');

            kesini_latihan3:
            write  ('Ingin melakukan latihan yang lainnya (y/n) ? ');
            readln(c3);

            {Kondisi}

            if (c3='y') then begin
                    goto kesini_latihan1;
            end

            else if (c3='n') then begin
                    exit;
            end

            else begin
                    goto kesini_latihan3;
            end;

        end

        else if (c1=3) then begin

        	clrscr;
            writeln('>>>>>>>>>>>> [ LATIHAN KECEPATAN ] <<<<<<<<<<<');
            writeln;
            writeln('1.Lari Cepat');
            write  ('  > Total jarak yg ditempuh (m) = ');
            readln (A.mingguan[i].dkecepatan.jarLC);
            write  ('  > Dilakukan selama (detik)    = ');
            readln (A.mingguan[i].dkecepatan.wakLC);

            writeln('    Setara dengan = ',konversi(A.mingguan[i].dkecepatan.wakLC):0:2,' Menit');

            writeln;
            writeln('2.Sepeda Statis');
            write  ('  > Total kayuhan yg dilakukan  = ');
            readln (A.mingguan[i].dkecepatan.jumSS);
            write  ('  > Dilakukan selama (detik)    = ');
            readln (A.mingguan[i].dkecepatan.wakSS);

            writeln('    Setara dengan = ',konversi(A.mingguan[i].dkecepatan.wakSS):0:2,' Menit');

            writeln;
            writeln('----------------------------------------------');

            kesini_latihan4:
            write  ('Ingin melakukan latihan yang lainnya (y/n) ? ');
            readln(c4);

            {Kondisi}

            if (c4='y') then begin
            	goto kesini_latihan1;
            end

            else if (c4='n') then begin
           		exit;
            end

            else begin
            	goto kesini_latihan4;
            end;

        end

        else begin
        	goto kesini_latihan1;
        end;

	end;

	{Procedure Untuk Mengisi Nilai Pada Array A Kedalam Array B, Dipakai Di Procedure Sorting}
	procedure isi(var A ,B : datawaktu; i : integer);
	var
    	c : integer;

    begin
        for c:=1 to i do begin
        	B.mingguan[c].dwaktu.tgl        := A.mingguan[c].dwaktu.tgl;
	        B.mingguan[c].dwaktu.bln        := A.mingguan[c].dwaktu.bln;
	        B.mingguan[c].dwaktu.thn        := A.mingguan[c].dwaktu.thn;
	        B.mingguan[c].dkekuatan.jumPU   := A.mingguan[c].dkekuatan.jumPU;
	        B.mingguan[c].dkekuatan.jumSU   := A.mingguan[c].dkekuatan.jumSU;
	        B.mingguan[c].dkelincahan.wakZZ := A.mingguan[c].dkelincahan.wakZZ;
	        B.mingguan[c].dkelincahan.wakJB := A.mingguan[c].dkelincahan.wakJB;
	        B.mingguan[c].dkecepatan.wakLC  := A.mingguan[c].dkecepatan.wakLC;
	        B.mingguan[c].dkecepatan.jarLC  := A.mingguan[c].dkecepatan.jarLC;
	        B.mingguan[c].dkecepatan.wakSS  := A.mingguan[c].dkecepatan.wakSS;
	        B.mingguan[c].dkecepatan.jumSS  := A.mingguan[c].dkecepatan.jumSS;
        end
    end;

	{Procedure Untuk Menampilkan Data Latihan}
	procedure viewdata(A : datawaktu; i : integer);
	var
    	c : integer;

    begin
        writeln('===================[ DATA LATIHAN KEBUGARAN ]===================');
        writeln;
        for c:=1 to i do begin
            writeln('----------------------------------------------------------------');
            writeln('Latihan Kebugaran Pada : ',A.mingguan[c].dwaktu.tgl,'-',A.mingguan[c].dwaktu.bln,'-',A.mingguan[c].dwaktu.thn);
            if (A.mingguan[c].dkekuatan.jumPU <> 0) then begin
            writeln('  > Push Up sebanyak = ',A.mingguan[c].dkekuatan.jumPU,'x'); end;
            if (A.mingguan[c].dkekuatan.jumSU <> 0) then begin
            writeln('  > Sit Up sebanyak  = ',A.mingguan[c].dkekuatan.jumSU,'x'); end;
            if (A.mingguan[c].dkelincahan.wakZZ <> 0) then begin
            writeln('  > Lari ZigZag      = ',konversi(A.mingguan[c].dkelincahan.wakZZ):0:2,' Menit'); end;
            if (A.mingguan[c].dkelincahan.wakJB <> 0) then begin
            writeln('  > Jongkok-Berdiri  = ',konversi(A.mingguan[c].dkelincahan.wakJB):0:2,' Menit'); end;
            if (A.mingguan[c].dkecepatan.jarLC <> 0) and (A.mingguan[c].dkecepatan.wakLC <> 0) then begin
            writeln('  > Lari Cepat       = ',A.mingguan[c].dkecepatan.jarLC,' Meter, Dalam ',konversi(A.mingguan[c].dkecepatan.wakLC):0:2,' Menit | ',rumus(A.mingguan[c].dkecepatan.jarLC,A.mingguan[c].dkecepatan.wakLC):0:2,' m/s'); end;
            if (A.mingguan[c].dkecepatan.jumSS <> 0) and (A.mingguan[c].dkecepatan.wakSS <> 0) then begin
            writeln('  > Sepeda Statis    = ',A.mingguan[c].dkecepatan.jumSS,' Kayuhan, Dalam ',konversi(A.mingguan[c].dkecepatan.wakSS):0:2,' Menit | ',rumus(A.mingguan[c].dkecepatan.jumSS,A.mingguan[c].dkecepatan.wakSS):0:2,' k/s'); end;
        end;
        writeln('----------------------------------------------------------------');
    end;

	{Procedure Untuk Mengurutkan Data Latihan}
	procedure sortdata(A, B : datawaktu; i : integer);
	label
    	kesini_sort;

    var
        c : integer;
        k, l, q, s, kmin, temp : integer; {Dipake untuk sort}
        d, cek : integer; {Dipake untuk Algoritma mencegah menampilkan nilai yang sama}
        idxn : array[1..7] of integer;

        {Variabel khusus untuk yang memakai rumus kecepatan}

        r : integer;
        temp2, cek2 : real;
        hasil1 : array[1..7] of real; {Untuk menyimpan data kecepatan dari rumus jarak dibagi waktu, kemudian di sorting}
        hasil2 : array[1..7] of real; {Array ini kegunaannya sama, tetapi tidak untuk di sorting, hanya sebagai pembanding}
        idxn2 : array[1..7] of real;

    begin

        kesini_sort:

        clrscr;
        writeln('============[ URUTKAN DATA LATIHAN ]============');
        writeln;
        writeln('Berdasarkan :');
        writeln('1.Push Up terbanyak');
        writeln('2.Sit Up terbanyak');
        writeln('3.Lari Zig-Zag terlama');
        writeln('4.Jongkok-Berdiri terlama');
        writeln('5.Lari Cepat tercepat');       {Memakai Function Rumus Kecepatan (m/s)}
        writeln('6.Sepeda Statis tercepat');    {Memakai Function Rumus Kecepatan (m/s)}
        writeln;
        write  ('Pilih Menu ke = ');
        readln (c);
        writeln;

        {Metode Selection Sort}

        { for k:=1 to i-1 do begin
                kmin := k;

                for l:=k+1 to i do begin
                        if (A[l] < A[kmin]) then begin
                                kmin := l;
                        end;
                end;

                temp    := A[k];
                A[K]    := A[kmin];
                A[kmin] := temp;
        end; }

        {Kondisi}

        //----------------------------------------------------------------------------------------------------------------------------------------------------------//

        if (c=1) then begin

	        for k:=1 to i-1 do begin
                kmin := k;

                for l:=k+1 to i do begin
                    if (A.mingguan[l].dkekuatan.jumPU < A.mingguan[kmin].dkekuatan.jumPU) then begin
                        kmin := l;
                    end;
                end;

                temp := A.mingguan[k].dkekuatan.jumPU;
                A.mingguan[k].dkekuatan.jumPU := A.mingguan[kmin].dkekuatan.jumPU;
                A.mingguan[kmin].dkekuatan.jumPU := temp;
	        end;

	        writeln('=====[ URUTAN PUSH UP DARI YANG TERBANYAK ]=====');
	        writeln;

	        d := 0;
	        cek := 0;

	        for q:=i downto 1 do begin

                {Ini Algoritma untuk mencegah menampilkan nilai yang sama, dan tidak menampilkan jika 0}
                if (A.mingguan[q].dkekuatan.jumPU <> cek) and (A.mingguan[q].dkekuatan.jumPU <> 0) then begin
                    writeln('Sebanyak ',A.mingguan[q].dkekuatan.jumPU,'x');
                    d := d + 1;
                    idxn[d] := A.mingguan[q].dkekuatan.jumPU;
                    cek := idxn[d];

                    {Ini Algoritma untuk menampilkan Waktu yang sesuai dengan jumlah latihannya}
                    for s:=1 to i do begin
                        if (A.mingguan[q].dkekuatan.jumPU) = (B.mingguan[s].dkekuatan.jumPU) then begin
                            writeln('> Dilakukan Pada : ',B.mingguan[s].dwaktu.tgl,'-',B.mingguan[s].dwaktu.bln,'-',B.mingguan[s].dwaktu.thn);
                        end;
                    end;
                    writeln;
                end;

        	end;

        	readln;

        end

        //----------------------------------------------------------------------------------------------------------------------------------------------------------//

        else if (c=2) then begin

        	for k:=1 to i-1 do begin
                kmin := k;

                for l:=k+1 to i do begin
                    if (A.mingguan[l].dkekuatan.jumSU < A.mingguan[kmin].dkekuatan.jumSU) then begin
                        kmin := l;
                    end;
                end;

                temp := A.mingguan[k].dkekuatan.jumSU;
                A.mingguan[k].dkekuatan.jumSU := A.mingguan[kmin].dkekuatan.jumSU;
                A.mingguan[kmin].dkekuatan.jumSU := temp;
       		end;

	        writeln('======[ URUTAN SIT UP DARI YANG TERBANYAK ]=====');
	        writeln;

	        d := 0;
	        cek := 0;

	        for q:=i downto 1 do begin

	            {Ini Algoritma untuk mencegah menampilkan nilai yang sama, dan tidak menampilkan jika 0}
	            if (A.mingguan[q].dkekuatan.jumSU <> cek) and (A.mingguan[q].dkekuatan.jumSU <> 0) then begin
	                writeln('Sebanyak ',A.mingguan[q].dkekuatan.jumSU,'x');
	                d := d + 1;
	                idxn[d] := A.mingguan[q].dkekuatan.jumSU;
	                cek := idxn[d];

	                {Ini Algoritma untuk menampilkan Waktu yang sesuai dengan jumlah latihannya}
	                for s:=1 to i do begin
	                    if (A.mingguan[q].dkekuatan.jumSU) = (B.mingguan[s].dkekuatan.jumSU) then begin
	                        writeln('> Dilakukan Pada : ',B.mingguan[s].dwaktu.tgl,'-',B.mingguan[s].dwaktu.bln,'-',B.mingguan[s].dwaktu.thn);
	                    end;
	                end;
	                writeln;
	            end;

	        end;

	        readln;

        end

        //----------------------------------------------------------------------------------------------------------------------------------------------------------//

        else if (c=3) then begin

        	for k:=1 to i-1 do begin
                kmin := k;

                for l:=k+1 to i do begin
                    if (A.mingguan[l].dkelincahan.wakZZ) < (A.mingguan[kmin].dkelincahan.wakZZ) then begin
                        kmin := l;
                    end;
                end;

                temp := A.mingguan[k].dkelincahan.wakZZ;
                A.mingguan[k].dkelincahan.wakZZ := A.mingguan[kmin].dkelincahan.wakZZ;
                A.mingguan[kmin].dkelincahan.wakZZ := temp;
       		end;

	        writeln('====[ URUTAN LARI ZIG-ZAG DARI YANG TERLAMA ]===');
	        writeln;

	        d := 0;
	        cek := 0;

	        for q:=i downto 1 do begin

                {Ini Algoritma untuk mencegah menampilkan nilai yang sama, dan tidak menampilkan jika 0}
                if (A.mingguan[q].dkelincahan.wakZZ <> cek) and (A.mingguan[q].dkelincahan.wakZZ <> 0) then begin
                    writeln('Selama ',konversi(A.mingguan[q].dkelincahan.wakZZ):0:2,' Menit');
                    d := d + 1;
                    idxn[d] := A.mingguan[q].dkelincahan.wakZZ;
                    cek := idxn[d];

                    {Ini Algoritma untuk menampilkan Waktu yang sesuai dengan jumlah latihannya}
                    for s:=1 to i do begin
                        if (A.mingguan[q].dkelincahan.wakZZ) = (B.mingguan[s].dkelincahan.wakZZ) then begin
                            writeln('> Dilakukan Pada : ',B.mingguan[s].dwaktu.tgl,'-',B.mingguan[s].dwaktu.bln,'-',B.mingguan[s].dwaktu.thn);
                        end;
                    end;
                    writeln;
                end;

	        end;

	        readln;

        end

        //----------------------------------------------------------------------------------------------------------------------------------------------------------//

        else if (c=4) then begin

        	for k:=1 to i-1 do begin
                kmin := k;

                for l:=k+1 to i do begin
                    if (A.mingguan[l].dkelincahan.wakJB) < (A.mingguan[kmin].dkelincahan.wakJB) then begin
                        kmin := l;
                    end;
                end;

                temp := A.mingguan[k].dkelincahan.wakJB;
                A.mingguan[k].dkelincahan.wakJB := A.mingguan[kmin].dkelincahan.wakJB;
                A.mingguan[kmin].dkelincahan.wakJB := temp;
        	end;

	        writeln('==[ URUTAN JONGKOK-BERDIRI DARI YANG TERLAMA ]==');
	        writeln;

	        d := 0;
	        cek := 0;

	        for q:=i downto 1 do begin

                {Ini Algoritma untuk mencegah menampilkan nilai yang sama, dan tidak menampilkan jika 0}
                if (A.mingguan[q].dkelincahan.wakJB <> cek) and (A.mingguan[q].dkelincahan.wakJB <> 0) then begin
                    writeln('Selama ',konversi(A.mingguan[q].dkelincahan.wakJB):0:2,' Menit');
                    d := d + 1;
                    idxn[d] := A.mingguan[q].dkelincahan.wakJB;
                    cek := idxn[d];

                    {Ini Algoritma untuk menampilkan Waktu yang sesuai dengan jumlah latihannya}
                    for s:=1 to i do begin
                        if (A.mingguan[q].dkelincahan.wakJB) = (B.mingguan[s].dkelincahan.wakJB) then begin
                            writeln('> Dilakukan Pada : ',B.mingguan[s].dwaktu.tgl,'-',B.mingguan[s].dwaktu.bln,'-',B.mingguan[s].dwaktu.thn);
                        end;
                    end;
                    writeln;
                end;

	        end;

	        readln;

        end

        //----------------------------------------------------------------------------------------------------------------------------------------------------------//

        else if (c=5) then begin

        	{Sebelum Sort, mencari dulu Kecepatan dari data Jarak & Waktu, kemudian disimpan kedalam Array}
            for r:=1 to i do begin
                if (A.mingguan[r].dkecepatan.jarLC <> 0) and (A.mingguan[r].dkecepatan.wakLC <> 0) then begin
                    hasil1[r] := rumus(A.mingguan[r].dkecepatan.jarLC,A.mingguan[r].dkecepatan.wakLC);
                    hasil2[r] := rumus(B.mingguan[r].dkecepatan.jarLC,A.mingguan[r].dkecepatan.wakLC);
                end;
            end;

            {Sorting untuk Kecepatan - Array hasil1}
            for k:=1 to i-1 do begin
                kmin := k;

                for l:=k+1 to i do begin
                    if (hasil1[l]) < (hasil1[kmin]) then begin
                        kmin := l;
                    end;
                end;

                temp2 := hasil1[k];
                hasil1[k] := hasil1[kmin];
                hasil1[kmin] := temp2;
            end;

            writeln('=====[ URUTAN LARI CEPAT DARI YANG TERCEPAT]====');
            writeln;

            d := 0;
            cek2 := 0;

            for q:=i downto 1 do begin

                {Ini Algoritma untuk mencegah menampilkan nilai yang sama, dan tidak menampilkan jika 0}
                if (hasil1[q] <> cek2) and (B.mingguan[q].dkecepatan.jarLC <> 0) and (B.mingguan[q].dkecepatan.wakLC <> 0) then begin
                    writeln('Secepat ',hasil1[q]:0:2,' m/s');
                    d := d + 1;
                    idxn2[d] := hasil1[q];
                    cek2 := idxn2[d];

                    {Ini Algoritma untuk menampilkan Waktu yang sesuai dengan jumlah latihannya}
                    for s:=1 to i do begin
                        if (hasil1[q]) = (hasil2[s]) then begin
                            writeln('> Dilakukan Pada : ',B.mingguan[s].dwaktu.tgl,'-',B.mingguan[s].dwaktu.bln,'-',B.mingguan[s].dwaktu.thn);
                        end;
                    end;
                    writeln;
                end;

            end;

            readln;

        end

        //----------------------------------------------------------------------------------------------------------------------------------------------------------//

        else if (c=6) then begin

        	{Sebelum Sort, mencari dulu Kecepatan dari data Jarak & Waktu, kemudian disimpan kedalam Array}
            for r:=1 to i do begin
                if (A.mingguan[r].dkecepatan.jumSS <> 0) and (A.mingguan[r].dkecepatan.wakSS <> 0) then begin
                    hasil1[r] := rumus(A.mingguan[r].dkecepatan.jumSS,A.mingguan[r].dkecepatan.wakSS);
                    hasil2[r] := rumus(B.mingguan[r].dkecepatan.jumSS,A.mingguan[r].dkecepatan.wakSS);
                end;
            end;

            {Sorting untuk Kecepatan - Array hasil1}
            for k:=1 to i-1 do begin
                kmin := k;

                for l:=k+1 to i do begin
                    if (hasil1[l]) < (hasil1[kmin]) then begin
                        kmin := l;
                    end;
                end;

                temp2 := hasil1[k];
                hasil1[k] := hasil1[kmin];
                hasil1[kmin] := temp2;
            end;

            writeln('===[ URUTAN SEPEDA STATIS DARI YANG TERCEPAT]===');
            writeln;

            d := 0;
            cek2 := 0;

            for q:=i downto 1 do begin

                {Ini Algoritma untuk mencegah menampilkan nilai yang sama, dan tidak menampilkan jika 0}
                if (hasil1[q] <> cek2) and (B.mingguan[q].dkecepatan.jumSS <> 0) and (B.mingguan[q].dkecepatan.wakSS <> 0) then begin
                    writeln('Secepat ',hasil1[q]:0:2,' kayuhan/s');
                    d := d + 1;
                    idxn2[d] := hasil1[q];
                    cek2 := idxn2[d];

                    {Ini Algoritma untuk menampilkan Waktu yang sesuai dengan jumlah latihannya}
                    for s:=1 to i do begin
                        if (hasil1[q]) = (hasil2[s]) then begin
                            writeln('> Dilakukan Pada : ',B.mingguan[s].dwaktu.tgl,'-',B.mingguan[s].dwaktu.bln,'-',B.mingguan[s].dwaktu.thn);
                        end;
                    end;
                    writeln;
                end;

            end;

            readln;

        end

        //----------------------------------------------------------------------------------------------------------------------------------------------------------//

        else begin
        	goto kesini_sort;
        end;

    end;

	{Procedure Untuk Mencari Data Latihan}
	procedure searchdata(var A : datawaktu; i : integer);
	label
        kesana1, kesana2, kesana3, kesana4, kesana5, ks1, ks2, ks3, ks4, ks5, ks6;

    var
        x, c : integer;

        {Variabel yang digunakan khusus untuk fitur Update & Delete}

        n1, n2, n3 : integer;
        m1, m2, m3, m4, m5, m6 : string;

    begin

        writeln('==============[ CARI DATA LATIHAN ]=============');
        writeln;
        write  ('Tanggal latihan = '); readln(x);
        writeln;

        {Metode Sequential Search}

        {Yang di-Check di Sort hanya tanggal saja, karena dalam 1 Minggu hanya tanggal lah yang berbeda,
         sedangkan bulan dan tahun bisa sama bisa beda, kalau beda pun tetap acuan selalu pada tanggal}

        c:=1;

        while (c < i) and (x <> A.mingguan[c].dwaktu.tgl) do begin
                c := c + 1;
        end;

        if (x = A.mingguan[c].dwaktu.tgl) then begin

	        writeln('===============[ DATA DITEMUKAN ]===============');
	        writeln;
	        if (A.mingguan[c].dkekuatan.jumPU <> 0) then begin
	        writeln('> Push Up sebanyak = ',A.mingguan[c].dkekuatan.jumPU,'x'); end;
	        if (A.mingguan[c].dkekuatan.jumSU <> 0) then begin
	        writeln('> Sit Up sebanyak  = ',A.mingguan[c].dkekuatan.jumSU,'x'); end;
	        if (A.mingguan[c].dkelincahan.wakZZ <> 0) then begin
	        writeln('> Lari ZigZag      = ',konversi(A.mingguan[c].dkelincahan.wakZZ):0:2,' Menit'); end;
	        if (A.mingguan[c].dkelincahan.wakJB <> 0) then begin
	        writeln('> Jongkok-Berdiri  = ',konversi(A.mingguan[c].dkelincahan.wakJB):0:2,' Menit'); end;
	        if (A.mingguan[c].dkecepatan.jarLC <> 0) and (A.mingguan[c].dkecepatan.wakLC <> 0) then begin
	        writeln('> Lari Cepat       = ',A.mingguan[c].dkecepatan.jarLC,' Meter, Dalam ',konversi(A.mingguan[c].dkecepatan.wakLC):0:2,' Menit | ',rumus(A.mingguan[c].dkecepatan.jarLC,A.mingguan[c].dkecepatan.wakLC):0:2,' m/s'); end;
	        if (A.mingguan[c].dkecepatan.jumSS <> 0) and (A.mingguan[c].dkecepatan.wakSS <> 0) then begin
	        writeln('> Sepeda Statis    = ',A.mingguan[c].dkecepatan.jumSS,' Kayuhan, Dalam ',konversi(A.mingguan[c].dkecepatan.wakSS):0:2,' Menit | ',rumus(A.mingguan[c].dkecepatan.jumSS,A.mingguan[c].dkecepatan.wakSS):0:2,' k/s'); end;
	        writeln;

	        writeln('===========[ MANIPULASI DATA LATIHAN ]==========');
	        writeln;
	        writeln('1.Update/Isi Data');
	        writeln('2.Hapus Data');
	        writeln('3.Kembali');
	        writeln;

	        kesana1:
	        write  ('Pilih Menu ke = ');
	        readln (n1);

	        {Kondisi}

	      	if (n1=1) then begin

                kesana3:
                clrscr;
                writeln('===[ PILIH LATIHAN YANG AKAN DI-UPDATE / DI-ISI ]===');
                writeln;
                writeln('1.Latihan Kekuatan (Strenght)');
                writeln('2.Latihan Kelincahan (Agility)');
                writeln('3.Latihan Kecepatan (Speed)');
                writeln;

                kesana2:
                write  ('Pilih Menu ke = ');
                readln(n2);

	            {Kondisi}

	            if (n2=1) then begin

                    clrscr;
                    writeln('>>>>>> [ UPDATE / ISI LATIHAN KEKUATAN ] <<<<<');
                    writeln;
                    writeln('1.Push Up');
                    write  ('  Dilakukan sebanyak = ');
                    readln (A.mingguan[c].dkekuatan.jumPU);
                    writeln;
                    writeln('2.Sit Up');
                    write  ('  Dilakukan sebanyak = ');
                    readln (A.mingguan[c].dkekuatan.jumSU);
                    writeln;
                    writeln('----------------------------------------------');

                    ks1:
                    write  ('Ingin mengupdate latihan yang lainnya (y/n) ? ');
                    readln (m1);

                    {Kondisi}

                    if (m1='y') then begin
                        goto kesana3;
                    end

                    else if (m1='n') then begin
                        exit;
                    end

                    else begin
                        goto ks1;
                    end;

	            end

	            else if (n2=2) then begin

                    clrscr;
                    writeln('>>>>> [ UPDATE / ISI LATIHAN KELINCAHAN ] <<<<');
                    writeln;
                    writeln('1.Lari ZigZag');
                    write  ('  Dilakukan selama (detik) = ');
                    readln (A.mingguan[c].dkelincahan.wakZZ);

                    writeln('  Setara dengan = ',konversi(A.mingguan[c].dkelincahan.wakZZ):0:2,' Menit');

                    writeln;
                    writeln('2.Jongkok-Berdiri');
                    write  ('  Dilakukan selama (detik) = ');
                    readln (A.mingguan[c].dkelincahan.wakJB);

                    writeln('  Setara dengan = ',konversi(A.mingguan[c].dkelincahan.wakJB):0:2,' Menit');

                    writeln;
                    writeln('----------------------------------------------');

                    ks2:
                    write  ('Ingin mengupdate latihan yang lainnya (y/n) ? ');
                    readln (m2);

                    {Kondisi}

                    if (m2='y') then begin
                        goto kesana3;
                    end

                    else if (m2='n') then begin
                        exit;
                    end

                    else begin
                        goto ks2;
                    end;

	            end

	            else if (n2=3) then begin

                    clrscr;
                    writeln('>>>>> [ UPDATE / ISI LATIHAN KECEPATAN ] <<<<<');
                    writeln;
                    writeln('1.Lari Cepat');
                    write  ('  > Total jarak yg ditempuh (m) = ');
                    readln (A.mingguan[c].dkecepatan.jarLC);
                    write  ('  > Dilakukan selama (detik)    = ');
                    readln (A.mingguan[c].dkecepatan.wakLC);

                    writeln('    Setara dengan = ',konversi(A.mingguan[c].dkecepatan.wakLC):0:2,' Menit');

                    writeln;
                    writeln('2.Sepeda Statis');
                    write  ('  > Total kayuhan yg dilakukan  = ');
                    readln (A.mingguan[c].dkecepatan.jumSS);
                    write  ('  > Dilakukan selama (detik)    = ');
                    readln (A.mingguan[c].dkecepatan.wakSS);

                    writeln('    Setara dengan = ',konversi(A.mingguan[c].dkecepatan.wakSS):0:2,' Menit');

                    writeln;
                    writeln('----------------------------------------------');

                    ks3:
                    write  ('Ingin mengupdate latihan yang lainnya (y/n) ? ');
                    readln (m3);

                    {Kondisi}

                    if (m3='y') then begin
                        goto kesana3;
                    end

                    else if (m3='n') then begin
                        exit;
                    end

                    else begin
                        goto ks3;
                    end;

	            end

	            else begin
                    goto kesana2;
	            end;

        	end

        	else if (n1=2) then begin

                clrscr;

                kesana5:
                clrscr;
                writeln('========[ PILIH LATIHAN YANG AKAN DI-HAPUS ]========');
                writeln;
                writeln('1.Latihan Kekuatan (Strenght)');
                writeln('2.Latihan Kelincahan (Agility)');
                writeln('3.Latihan Kecepatan (Speed)');
                writeln;

                kesana4:
                write  ('Pilih Menu ke = ');
                readln(n3);

                {Kondisi}

                if (n3=1) then begin

	                clrscr;
	                A.mingguan[c].dkekuatan.jumPU := 0;
	                A.mingguan[c].dkekuatan.jumSU := 0;

	                writeln('Data latihan telah terhapus!');
	                writeln;
	                writeln('----------------------------------------------');

	                ks4:
	                write  ('Ingin menghapus latihan yang lainnya (y/n) ? ');
	                readln (m4);

                    {Kondisi}

                    if (m4='y') then begin
                        goto kesana5;
                    end

                    else if (m4='n') then begin
                        exit;
                    end

                    else begin
                        goto ks4;
                    end;

                end

                else if (n3=2) then begin

                    clrscr;
                    A.mingguan[c].dkelincahan.wakZZ := 0;
                    A.mingguan[c].dkelincahan.wakJB := 0;

                    writeln('Data latihan telah terhapus!');
                    writeln;
                    writeln('----------------------------------------------');

                    ks5:
                    write  ('Ingin menghapus latihan yang lainnya (y/n) ? ');
                    readln (m5);

                    {Kondisi}

                    if (m5='y') then begin
                        goto kesana5;
                    end

                    else if (m5='n') then begin
                        exit;
                    end

                    else begin
                        goto ks5;
                    end;

            	end

                else if (n3=3) then begin

	                clrscr;
	                A.mingguan[c].dkecepatan.jarLC := 0;
	                A.mingguan[c].dkecepatan.wakLC := 0;
	                A.mingguan[c].dkecepatan.jumSS := 0;
	                A.mingguan[c].dkecepatan.wakSS := 0;

	                writeln('Data latihan telah terhapus!');
	                writeln;
	                writeln('----------------------------------------------');

	                ks6:
	                write  ('Ingin menghapus latihan yang lainnya (y/n) ? ');
	                readln (m6);

                    {Kondisi}

                    if (m6='y') then begin
                        goto kesana5;
                    end

                    else if (m6='n') then begin
                        exit;
                    end

                    else begin
                        goto ks6;
                    end;

                end

                else begin
                    goto kesana4;
                end;

            end

            else if (n1=3) then begin
                exit;
            end

            else begin
                goto kesana1;
            end;

        end

        else begin
                writeln('Mohon maaf, data latihan tidak ditemukan!');
        end;

        readln;

    end;

{Program Utama}

begin

	i := 0; {i Awal Di Assign 0}

	utama:

    if (i mod 7 = 0) and (i <> 0) then begin {Kondisi Dimana Ketika User Telah Melakukan Latihan Selama 1 Minggu}

        clrscr;
        writeln('Anda Telah Melakukan Latihan Selama 7 Hari, Berikut Data Latihan Anda!');
        writeln;

        viewdata(A,i);
        writeln;

        pertanyaan:

        write('Apakah Ingin Melakukan Latihan Lagi Selama 7 Hari Kedepan (y/n) ? ');
        readln(m);

        {Kondisi}

        if (m='y') then begin

            for c:=1 to i do begin
                A.mingguan[c].dwaktu.tgl        := 0;
                A.mingguan[c].dwaktu.bln        := 0;
                A.mingguan[c].dwaktu.thn        := 0;
                A.mingguan[c].dkekuatan.jumPU   := 0;
                A.mingguan[c].dkekuatan.jumSU   := 0;
                A.mingguan[c].dkelincahan.wakZZ := 0;
                A.mingguan[c].dkelincahan.wakJB := 0;
                A.mingguan[c].dkecepatan.wakLC  := 0;
                A.mingguan[c].dkecepatan.jarLC  := 0;
                A.mingguan[c].dkecepatan.wakSS  := 0;
                A.mingguan[c].dkecepatan.jumSS  := 0;
            end;

            i:=0; {i Kembali Di-Assign Dengan 0, Agar Latihan Mulai Dari Awal Lagi}

        end

        else if (m='n') then begin
            exit;
        end

        else begin
            goto pertanyaan;
        end;

    end;

	clrscr;
	writeln('======[ PROGRAM LATIHAN KEBUGARAN MINGGUAN ]======');
	writeln('--------- M.Raihan.R.A | IF.40-11 | 2016 ---------');
	writeln;
	writeln('1. Latihan Kebugaran');
	writeln('2. Tampilkan Data Latihan');
	writeln('3. Urutkan Data Latihan');
	writeln('4. Cari Data Latihan');
	writeln('5. Keluar');
	writeln;
	write  ('Pilih Menu ke = ');
	readln (n);

	{Kondisi}

	if (n=1) then begin
		clrscr;
		i := i + 1;	{i Akan Selalu Bertambah 1, Ketika User Menginputkan Data Latihan Yang Baru}
		insert_tanggal(A,i);
		clrscr;
		insert_latihan(A,i);
		readln;
		goto utama;
	end

	else if (n=2) then begin
		clrscr;
		viewdata(A,i);
		readln;
		goto utama;
	end

	else if (n=3) then begin
		clrscr;
		isi(A,B,i);
		sortdata(A,B,i);
		goto utama;
	end

	else if (n=4) then begin
		clrscr;
		searchdata(A,i);
		readln;
		goto utama;
	end

	else if (n=5) then begin
		exit;
	end

	else begin
		goto utama;
	end;

end.