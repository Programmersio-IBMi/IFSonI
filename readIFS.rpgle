**Free
     Ctl-Opt DftActGrp(*No) ;

     // ProtoType Declaration for 'open'
     Dcl-PR OpenIfs Int(10) ExtProc('open') ;
       pIfsPath Pointer Value Options(*String) ;
       pFileStatusFlag Int(10) Value ;
       pFilePermission Uns(10) Value Options(*NoPass) ;
       pOutputCcsId Uns(10) Value Options(*NoPass) ;
     End-PR ;

     // ProtoType Declaration for 'read'
     Dcl-PR ReadIfs Int(10) ExtProc('read') ;
       pFileDescriptor Int(10) Value ;
       pIfsData Pointer Value ;
       pBytesRetrieved Uns(10) Value ;
     End-PR ;

     // ProtoType Declaration for 'close'
     Dcl-PR CloseIfs Int(10) ExtProc('close') ;
       pFileDescriptor Int(10) Value ;
     End-PR ;

     // Constants Declaration
     Dcl-C ReadOnly 1 ;
     Dcl-C Text 16777216 ;
     Dcl-C CcsId 32 ;
     Dcl-C GroupAuthority 32 ;
     Dcl-C Path '/home/PREDDY/SampleIfs.txt' ;

     // Stand Alone Variables Declaration
     Dcl-S FileDescriptor Int(10) ;
     Dcl-S Length Int(10) ;
     Dcl-S IfsData Char(100) ;
     Dcl-S IfsRecord Char(100) ;
     Dcl-S StartPos Packed(3) ;
     Dcl-S EndPos Like(StartPos) ;

     // Open IFS File
     FileDescriptor = OpenIfs(Path
                             :ReadOnly + Text + CcsId
                             :GroupAuthority
                             :37) ;

     If FileDescriptor < 0 ;
       Dsply ('Problem While accessing IFS file.') ;
       *InLr = *On ;
       Return ;
     Else ;
       Dow 1 = 1 ;

         // Read IFS File
         Length = ReadIfs(FileDescriptor : %Addr(IfsData) : %Size(IfsData) ) ;
         If Length = 0 ;
           Leave ;
         ElseIf Length < %Size(IfsData) ;
           %SubSt(IfsData : (Length + 1)) = ' ' ;
         EndIf ;

         StartPos = *Zeros ;

         Dow 2 = 2 ;

           // Write Data into IFS file
           EndPos = %Scan(x'25' : IfsData : StartPos + 1) ;
           If EndPos > *Zeros ;
             IfsRecord = %SubSt(IfsData : StartPos + 1 :
                          EndPos - StartPos - 1) ;
             Dsply IfsRecord ;
             StartPos = EndPos ;
           Else ;
             Leave ;
           EndIf ;
         EndDo ;
       EndDo ;
     EndIf ;

     // Close File
     CloseIfs(FileDescriptor) ;
     *InLr = *On ;
     
