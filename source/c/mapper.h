
// Set the first 8kb prg bank
extern void __fastcall__ mmc3_set_prg_bank_0(unsigned char bank);
// Set the second 8kb prg bank
extern void __fastcall__ mmc3_set_prg_bank_1(unsigned char bank);
// Set the first 2kb chr bank
extern void __fastcall__ mmc3_set_2kb_chr_bank_0(unsigned char bank);
// Set the second 2kb chr bank
extern void __fastcall__ mmc3_set_2kb_chr_bank_1(unsigned char bank);
// Set the first 1kb chr bank
extern void __fastcall__ mmc3_set_1kb_chr_bank_0(unsigned char bank);
// Set the second 1kb chr bank
extern void __fastcall__ mmc3_set_1kb_chr_bank_1(unsigned char bank);
// Set the third 1kb chr bank
extern void __fastcall__ mmc3_set_1kb_chr_bank_2(unsigned char bank);
// Set the fourth 1kb chr bank
extern void __fastcall__ mmc3_set_1kb_chr_bank_3(unsigned char bank);
// Store mirroring value to mmc3 register
extern void __fastcall__ mmc3_set_mirroring(unsigned char mirroring);

