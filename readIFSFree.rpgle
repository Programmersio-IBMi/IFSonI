  ctl-opt dftactgrp(*no) ;

  dcl-pr OpenFile int(10) extproc('open') ;
    *n pointer value options(*string) ;
    *n int(10) value ;
    *n uns(10) value options(*nopass) ;
    *n uns(10) value options(*nopass) ;
    *n uns(10) value options(*nopass) ;
   end-pr ;

   dcl-pr ReadFile int(10) extproc('read') ;
     *n int(10) value ;
     *n pointer value ;
     *n uns(10) value ;
   end-pr ;

   dcl-pr CloseFile int(10) extproc('close') ;
     *n  int(10) value ;
   end-pr ;

  dcl-c O_RDONLY 1 ;           //Read only
  dcl-c O_TEXTDATA 16777216 ;  //Open in text mode
  dcl-c O_CCSID 32 ;           //CCSID
  dcl-c S_IRGRP 32 ;           //Group authority
  dcl-s fd int(10) ;
  dcl-s Length int(10) ;
  dcl-s Data char(100) ;
  dcl-s Array char(100) dim(20) ;
  dcl-s Element packed(3) ;
  dcl-s Start packed(3) ;
  dcl-s End like(Start) ;
  dcl-c Path '/SIMON/test_read.txt' ;

  fd = OpenFile(Path :
                O_RDONLY + O_TEXTDATA + O_CCSID :
                S_IRGRP :
                37) ;
  if (fd < 0) ;
    dsply ('IFS file ' + path + ' could not be opened') ;
    *inlr = *on ;
    return ;
  endif ;

  dow (1 = 1) ;
    Length  = ReadFile(fd:%addr(Data):%size(Data)) ;

    if (Length = 0) ;
      leave ;
    elseif (Length < %size(Data)) ;
      %subst(Data:(length + 1)) = ' ' ;
    endif ;

    Start = 0 ;
    dow (2 = 2) ;
      Element += 1 ;
      End = %scan(x'25':Data:(Start + 1)) ;

      if (End > 0) ;

        if (Array(Element) = ' ') ;
          Array(Element) = %subst(Data:(Start + 1):
                                 ((End - Start) - 2)) ;
        else ;
          Array(Element) = %trimr(Array(Element)) +
                           %subst(Data:(Start + 1):
                                 ((End - Start) - 2)) ;
        endif ;
        Start = End ;
      else ;

        Array(Element) = %subst(Data:(Start + 1)) ;
        Element -= 1 ;
        leave ;
      endif ;

    enddo ;

  enddo ;
  
  CloseFile(fd) ;
  *inlr = *on ;
