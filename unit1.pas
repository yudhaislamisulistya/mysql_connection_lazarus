unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql57conn, mysql56conn, sqldb, db, Forms, Controls,
  Graphics, Dialogs, StdCtrls, DBGrids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    EName: TEdit;
    EStambuk: TEdit;
    EKelas: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MySQL56Connection1: TMySQL56Connection;
    SQLQuery1: TSQLQuery;
    SQLQuery2: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    SQLTransaction2: TSQLTransaction;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure RefreshClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  SQLQuery1.SQL.Text:= 'insert into mahasiswa (nama, stambuk, kelas) values (:nama, :stambuk, :kelas)';
  SQLQuery1.Params.ParamByName('nama').AsString:=EName.Text;
  SQLQuery1.Params.ParamByName('stambuk').AsString:=EStambuk.Text;
  SQLQuery1.Params.ParamByName('kelas').AsString:=EKelas.Text;
  SQLQuery1.ExecSQL;
  SQLTransaction1.Commit;
  ShowMessage('Data Berhasil Ditambahkan');
  SQLQuery2.Open;
  SQLQuery2.Refresh;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SQLQuery2.Open;
  SQLQuery2.Refresh;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TForm1.RefreshClick(Sender: TObject);
begin

end;

end.

