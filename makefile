#
DISKNAME = test.dsk

PYTHON = python.exe
JAVA = java.exe -jar
ACME = acme.exe -f plain -o
AC = $(JAVA) $(A2SDK)\bin\ac.jar 
LZ4 = lz4.exe
ZPACK = zpacker.exe
DIRECTWRITE = $(PYTHON27) $(A2SDK)\bin\dw.py
INSERTBIN = $(PYTHON27) $(A2SDK)\bin\InsertBIN.py
TRANSAIR = $(PYTHON27) $(A2SDK)\bin\transair.py
GENDSK = $(PYTHON27) $(A2SDK)\bin\genDSK.py
COPYFILES = $(PYTHON27) $(A2SDK)\bin\InsertZIC.py
APPLEWIN = $(APPLEWINPATH)\Applewin.exe -d1

EMULATOR = $(APPLEWIN)

all: $(DISKNAME)

$(DISKNAME): main.b 
#	REMOVE OLD FILE (mandatory)
	$(AC) -d $(DISKNAME) "TERRA NOVA"
# 	COPY TO DSK
	$(AC) -p $(DISKNAME) "TERRA NOVA" B 0xC00 <main.b

# 	EMULATOR
	copy lbl_main.txt $(APPLEWINPATH)\A2_USER1.SYM
	$(EMULATOR) $(DISKNAME)

main.b: main.a
	$(ACME) main.b main.a


clean:
	del *.b
	del lbl_*.txt
    