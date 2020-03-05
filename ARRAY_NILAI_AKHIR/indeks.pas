program DaftarNilaiMahasiswa;
{I.S. : user memasukkan data nilai akhir mahasiswa(1:N)}
{F.S. : menampilkan daftar nilai akhir mahasiswa}
uses crt;
//kamus global
const
  MaksMhs = 50;
type
  Larik1 = array[1..MaksMhs] of string;
  Larik2 = array[1..MaksMhs] of real;
  Larik3 = array[1..MaksMhs] of char;
var
  NIM, Nama                 : Larik1;
  Hadir,Tugas, UTS, UAS, NA : Larik2;
  Indeks                    : Larik3;
  N                         : integer;
  Matkul, Kelas             : string;

function NilaiAkhir(Hadir,Tugas,UTS,UAS:real):real;
begin
  NilaiAkhir := 0.1 * Hadir + 0.2 * Tugas + 0.3 * UTS + 0.4 * UAS;
end;

function IndeksNilai(NA : real):char;
begin
  if (NA >= 80) and (NA <= 100)
    then
      IndeksNilai := 'A'
    else
      if (NA >= 70) and (NA <= 80)
        then
          IndeksNilai := 'B'
        else
          if (NA >= 60) and (NA <= 70)
            then
              IndeksNilai := 'C'
            else
              if (NA >= 50) and (NA <= 60)
                then
                  IndeksNilai := 'D'
                else
                  IndeksNilai := 'E'


end;

function RataRata(Total : real; N : integer):real;
begin

end;

function NATertinggi(NA : Larik2):real;
var
  Batas : real;
  i     : integer;

begin
    Batas := 0;
    for i := 1 to MaksMhs do
    begin
        if(NA[i] > Batas) then
            Batas := NA[i];
    end;

    NATertinggi := Batas;

end;

function NATerendah(NA : Larik2):real;
var
    Batas : real;
    i     : integer;

begin
    Batas := 100;
    for i := 1 to MaksMhs do
    begin
        if(NA[i] < Batas) then
            Batas := NA[i];
    end;

    NATerendah := Batas;
end;




procedure IsiData(var Matkul, Kelas:string; var NIM,Nama:Larik1; var Hadir,Tugas,UTS,UAS,NA:Larik2; var Indeks:Larik3; var N:integer);
var
  i : integer;
begin
  textbackground(green); textcolor(yellow); clrscr;
  gotoxy(39,1); writeln('DAFTAR NILAI AKHIR MAHASISWA');
  write('Mata Kuliah : '); readln(Matkul);
  write('Kelas       : '); readln(Kelas);
  writeln('===========================================================================================');
  writeln('| No |   NIM    |     Nama Mahasiswa      |  Hadir  | Tugas |  UTS  |  UAS  | N.A. | Indeks |');
  writeln('-------------------------------------------------------------------------------------------');
  i := 1;
  gotoxy(1,7);
  write('|    |          |                         |         |       |       |       |      |        |');
  gotoxy(3,7); write(i);
  gotoxy(8,7); readln(NIM[i]);
  while(NIM[i] <> 'stop') and (NIM[i] <> 'STOP') and (i <= MaksMhs) do
  begin
    gotoxy(20,i+6); readln(Nama[i]);
    gotoxy(47,i+6); readln(Hadir[i]);
    gotoxy(56,i+6); readln(Tugas[i]);
    gotoxy(64,i+6); readln(UTS[i]);
    gotoxy(72,i+6); readln(UAS[i]);

    NA[i] := NilaiAkhir(Hadir[i], Tugas[i], UTS[i], UAS[i]);
    gotoxy(79,i+6); write(NA[i]:0:1);

    Indeks[i] := IndeksNilai(NA[i]);
    gotoxy(88,i+6); write(Indeks[i]);

    i := i + 1;
    gotoxy(1,i+6);
    write('|    |          |                         |         |       |       |       |      |        |');
    gotoxy(3,i+6); write(i);
    gotoxy(8,i+6); readln(NIM[i]);
  end; //endwhile
  N := i - 1;
  gotoxy(1,i+6);
  writeln('-------------------------------------------------------------------------------------------');
end;

begin
  IsiData(Matkul,Kelas,NIM,Nama,Hadir,Tugas,UTS,UAS,NA,Indeks,N);
  writeln('Nilai Tertinggi : ',NATertinggi(NA):0:1);
  writeln('Nilai Terendah : ',NATerendah(NA):0:1);
  readln;
end.
