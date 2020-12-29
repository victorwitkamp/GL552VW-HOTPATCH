DefinitionBlock("", "SSDT", 2, "hack", "batt", 0)
{
    External(_SB.PCI0, DeviceObj)
    External(_SB.PCI0.LPCB, DeviceObj)
    External(_SB.PCI0.LPCB.EC0, DeviceObj)
    
    External(BRAI, MethodObj)
    External(BRAD, MethodObj)
    
    Method (B1B2, 2, NotSerialized)
    { 
        Return(Or(Arg0, ShiftLeft(Arg1, 8)))
    }
    
    Scope (_SB.PCI0.LPCB.EC0)
    {
            Method (RE1B, 1, NotSerialized)
            {
                OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
                Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
                Return(BYTE)
            }
            
            Method (RECB, 2, Serialized)
            {
                ShiftRight(Arg1, 3, Arg1)
                Name(TEMP, Buffer(Arg1) { })
                Add(Arg0, Arg1, Arg1)
                Store(0, Local0)
                While (LLess(Arg0, Arg1))
                {
                    Store(RE1B(Arg0), Index(TEMP, Local0))
                    Increment(Arg0)
                    Increment(Local0)
                }
                Return(TEMP)
            }
            
            Method (WE1B, 2, NotSerialized)
            {
                OperationRegion(ERAM, EmbeddedControl, Arg0, 1)
                Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 }
                Store(Arg1, BYTE)
            }
            
            Method (WECB, 3, Serialized)
            {
                ShiftRight(Arg1, 3, Arg1)
                Name(TEMP, Buffer(Arg1) { })
                Store(Arg2, TEMP)
                Add(Arg0, Arg1, Arg1)
                Store(0, Local0)
                While (LLess(Arg0, Arg1))
                {
                    WE1B(Arg0, DerefOf(Index(TEMP, Local0)))
                    Increment(Arg0)
                    Increment(Local0)
                }
            }
            
            OperationRegion (XCOR, EmbeddedControl, Zero, 0xFF)
            Field(XCOR, ByteAcc, NoLock, Preserve)
            {
                Offset (0x93), 
                AH00,8,AH01,8, 
                AH10,8,AH11,8,
                Offset (0xB0), 
                B0P0,8,B0P1,8, 
                Offset (0xB4), 
                Offset (0xB6), 
                Offset (0xB8), 
                Offset (0xBA), 
                Offset (0xBC), 
                Offset (0xBE), 
                B0T0,8,B0T1,8, 
                B010,8,B011,8, 
                B020,8,B021,8, 
                B030,8,B031,8, 
                B040,8,B041,8, 
                Offset (0xD0), 
                B1P0,8,B1P1,8, 
                Offset (0xDE), 
                B1T0,8,B1T1,8, 
                B110,8,B111,8, 
                B120,8,B121,8, 
                B130,8,B131,8, 
                B140,8,B141,8, 
                Offset (0xF4), 
                B0N0,8,B0N1,8, 
                Offset (0xFC), 
                B1N0,8,B1N1,8,
            }
            
            OperationRegion (XMBX, EmbeddedControl, 0x18, 0x28)
            Field (XMBX, ByteAcc, NoLock, Preserve)
            {
                Offset(4),
                BDAX,    256,  
            }
            
            OperationRegion (XMB2, EmbeddedControl, 0x40, 0x28)
            Field (XMB2, ByteAcc, NoLock, Preserve)
            {
                Offset(4),
                BDAY,    256,  
            }
            
            Field (XMBX, ByteAcc, NoLock, Preserve)
            {
                Offset (0x04), 
                T2B0,8,T2B1,8,
            }
            
            IndexField (BRAI, BRAD, ByteAcc, NoLock, Preserve)
            {
                Offset (0xA0), 
                B0V0,8,B0V1,8, 
                B0R0,8,B0R1,8, 
                B0F0,8,B0F1,8, 
                B0M0,8,B0M1,8, 
                B0S0,8,B0S1,8, 
                B0C0,8,B0C1,8, 
                B0D0,8,B0D1,8, 
                B0D2,8,B0D3,8, 
                B1V0,8,B1V1,8, 
                B1R0,8,B1R1,8, 
                B1F0,8,B1F1,8, 
                B1M0,8,B1M1,8, 
                B1S0,8,B1S1,8, 
                B1C0,8,B1C1,8, 
                B1D0,8,B1D1,8, 
                B1D2,8,B1D3,8
            }
        
    }
}