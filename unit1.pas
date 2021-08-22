unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  SR: TSearchRec; // поисковая переменная
  FindRes: integer; // переменная для записи результата поиска
begin
  ListBox1.Clear; // очистка компонента ListBox1 перед занесением в него списка файлов

  // задание условий поиска и начало поиска
  FindRes := FindFirst('/home/edikku/tmp/testfolder/*', faAnyFile, SR);

  while FindRes = 0 do // пока мы находим файлы (каталоги), то выполнять цикл
  begin
    ListBox1.Items.Add(SR.Name); // добавление в список название найденного элемента
    FindRes := FindNext(SR); // продолжение поиска по заданным условиям
  end;
  FindClose(SR); // закрываем поиск
end;

end.
