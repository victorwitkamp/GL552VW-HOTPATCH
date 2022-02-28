// Fake ambient light sensor, configure keyboard brightness, and fix function keys
DefinitionBlock("", "SSDT", 2, "hack", "PS2K", 0) {
    External (\_SB.KBLV, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0.WRAM, MethodObj)
    External (_SB.ATKD, DeviceObj)
    Scope (_SB.ATKD) {
        Method (SKBV, 1, NotSerialized)
        {
            ^^PCI0.LPCB.EC0.WRAM (0x04B1, Arg0)
            Return (Arg0)
        }
    }

    External(\_SB.ATKD.IANE, MethodObj)

    External(_SB.PCI0.LPCB.EC0, DeviceObj)
    Scope(_SB.PCI0.LPCB.EC0) {
        External(ATKP, IntObj)
        External(XQ0A, MethodObj) // 5F513041 00A00E -> 58513041 00A00E
        External(XQ0B, MethodObj) // 5F513042 00A00E -> 58513042 00A00E
        External(XQ0E, MethodObj) // 5F513045 00A00E -> 58513045 00A00E
        External(XQ0F, MethodObj) // 5F513046 00A00E -> 58513046 00A00E
        External(XQ11, MethodObj) // 5F513131 00A00E -> 58513131 00A00E
        External(XQ12, MethodObj) // 5F513132 00A00E -> 58513132 00A00E

        Method (_Q0A) {
            If (ATKP) { \_SB.ATKD.IANE (0x5E) } // For sleep key (f1)
            // XQ0A() // <DON'T> Call the previous method
        }

        Method (_Q0B) {
            If (ATKP) { \_SB.ATKD.IANE (0x7D) } // For airplane mode (f2)
            XQ0B() // Call the previous method
        }

        Method (_Q0E) {
            If (ATKP) { \_SB.ATKD.IANE (0x20) } // For brightness (f5)
            XQ0E() // Call the previous method
        }

        Method (_Q0F) {
            If (ATKP) { \_SB.ATKD.IANE (0x10) } // For brightness (f6)
            XQ0F() // Call the previous method
        }

        Method (_Q11) {
            If (ATKP) { \_SB.ATKD.IANE (0x61) } // For projector (f8)
            XQ11() // Call the previous method
        }

        Method (_Q12) {
            If (ATKP) { \_SB.ATKD.IANE (0x6B) } // For trackpad disable (f9)
            XQ12() // Call the previous method
        }
    }
}