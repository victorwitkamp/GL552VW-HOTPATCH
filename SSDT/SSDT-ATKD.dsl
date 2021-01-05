DefinitionBlock ("", "SSDT", 2, "hack", "ATKD", 0)
{  
    External (_SB.PCI0.LPCB.EC0.WRAM, MethodObj)  
    External (_SB.ATKD, DeviceObj)
    Scope (_SB.ATKD) {
        Method (SKBV, 1, NotSerialized) {
            ^^PCI0.LPCB.EC0.WRAM (0x04B1, Arg0)
            Return (Arg0)
        }
    }
}    
