# GL552VW HOTPATCH
USING BIOS V304

Currently researching wether the following patches are required. Suggestions for patches are welcome.

1. [bat] ASUS G75VW
2. [sys] Fix _WAK Arg0 v2
3. [sys] HPET Fix
    _CRS to XCRS ON HPET
4. [sys] SMBUS Fix
5. [sys] IRQ Fix
6. [sys] RTC Fix
7. [sys] OS Check Fix Windows 8 / Windows 10
8. [sys] Fix Mutex with non-zero SyncLevel
9. [usb] 7-series/8-series USB
10. [usb] USB3_PRW 0x6D Skylake (instant wake)
11. [sys] Skylake LPC

# SSDTs

SSDT-AWAC: 
Not required according to SSDTTime: Could not locate any ACPI000E devices!

SSDT-BAT:
Battery hotpatch effort

SSDT-EC:
Fake EC by SSDTTime

SSDT-ETPD:
- CRS to XCRS in ETPD
- USTP to XSTP (To override USTP and enable _SB.PCI0.I2C1)

SSDT-GPI0:
Enable GPI0 by setting GPEN

SSDT-GPI0-ALT:
GPI0 controller enabling patch
- _STA with XSTA in GPI0 DSDT only (5F53544100A0099353425247 => 5853544100A0099353425247)

SSDT-HPET:
By SSDTTime
- HPET _CRS to XCRS Rename

SSDT-HPET-ALT:
- HPET _CRS to XCRS Rename

SSDT-SMBUS


SSDT-XOSI:
- _OSI to XOSI, all occurences in all APCI (5F4F5349 => 584F5349)