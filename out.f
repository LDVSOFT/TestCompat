Classfile /Users/jetbrains/Workspace/TestCompat/ourModule/build/classes/kotlin/main/our/OurCodeKt.class
  Last modified Dec 25, 2017; size 1976 bytes
  MD5 checksum d5fd487a5841155db5419734fdee1c38
  Compiled from "OurCode.kt"
public final class our.OurCodeKt
  minor version: 0
  major version: 52
  flags: ACC_PUBLIC, ACC_FINAL, ACC_SUPER
Constant pool:
    #1 = Utf8               our/OurCodeKt
    #2 = Class              #1            // our/OurCodeKt
    #3 = Utf8               java/lang/Object
    #4 = Class              #3            // java/lang/Object
    #5 = Utf8               main
    #6 = Utf8               ([Ljava/lang/String;)V
    #7 = Utf8               Lorg/jetbrains/annotations/NotNull;
    #8 = Utf8               args
    #9 = String             #8            // args
   #10 = Utf8               kotlin/jvm/internal/Intrinsics
   #11 = Class              #10           // kotlin/jvm/internal/Intrinsics
   #12 = Utf8               checkParameterIsNotNull
   #13 = Utf8               (Ljava/lang/Object;Ljava/lang/String;)V
   #14 = NameAndType        #12:#13       // checkParameterIsNotNull:(Ljava/lang/Object;Ljava/lang/String;)V
   #15 = Methodref          #11.#14       // kotlin/jvm/internal/Intrinsics.checkParameterIsNotNull:(Ljava/lang/Object;Ljava/lang/String;)V
   #16 = Utf8               api/A
   #17 = Class              #16           // api/A
   #18 = Utf8               <init>
   #19 = Utf8               ()V
   #20 = NameAndType        #18:#19       // "<init>":()V
   #21 = Methodref          #17.#20       // api/A."<init>":()V
   #22 = Utf8               same
   #23 = NameAndType        #22:#19       // same:()V
   #24 = Methodref          #17.#23       // api/A.same:()V
   #25 = Utf8               1
   #26 = String             #25           // 1
   #27 = Utf8               compat/rt/VersionBox
   #28 = Class              #27           // compat/rt/VersionBox
   #29 = Utf8               INSTANCE
   #30 = Utf8               Lcompat/rt/VersionBox;
   #31 = NameAndType        #29:#30       // INSTANCE:Lcompat/rt/VersionBox;
   #32 = Fieldref           #28.#31       // compat/rt/VersionBox.INSTANCE:Lcompat/rt/VersionBox;
   #33 = Utf8               accepts
   #34 = Utf8               (Ljava/lang/String;)Z
   #35 = NameAndType        #33:#34       // accepts:(Ljava/lang/String;)Z
   #36 = Methodref          #28.#35       // compat/rt/VersionBox.accepts:(Ljava/lang/String;)Z
   #37 = Utf8               v1
   #38 = NameAndType        #37:#19       // v1:()V
   #39 = Methodref          #17.#38       // api/A.v1:()V
   #40 = Utf8               paramDiff
   #41 = Utf8               (I)V
   #42 = NameAndType        #40:#41       // paramDiff:(I)V
   #43 = Methodref          #17.#42       // api/A.paramDiff:(I)V
   #44 = Utf8               api/V1
   #45 = Class              #44           // api/V1
   #46 = Methodref          #45.#20       // api/V1."<init>":()V
   #47 = Utf8               our/ClassForV1
   #48 = Class              #47           // our/ClassForV1
   #49 = Methodref          #48.#20       // our/ClassForV1."<init>":()V
   #50 = Utf8               kotlin/Unit
   #51 = Class              #50           // kotlin/Unit
   #52 = Utf8               Lkotlin/Unit;
   #53 = NameAndType        #29:#52       // INSTANCE:Lkotlin/Unit;
   #54 = Fieldref           #51.#53       // kotlin/Unit.INSTANCE:Lkotlin/Unit;
   #55 = Utf8               2
   #56 = String             #55           // 2
   #57 = Utf8               v2
   #58 = NameAndType        #57:#19       // v2:()V
   #59 = Methodref          #17.#58       // api/A.v2:()V
   #60 = Utf8               (II)V
   #61 = NameAndType        #40:#60       // paramDiff:(II)V
   #62 = Methodref          #17.#61       // api/A.paramDiff:(II)V
   #63 = Utf8               api/V2
   #64 = Class              #63           // api/V2
   #65 = Methodref          #64.#20       // api/V2."<init>":()V
   #66 = Utf8               our/ClassForV2
   #67 = Class              #66           // our/ClassForV2
   #68 = Methodref          #67.#20       // our/ClassForV2."<init>":()V
   #69 = Utf8               our/ImplCommonAbstract
   #70 = Class              #69           // our/ImplCommonAbstract
   #71 = Methodref          #70.#20       // our/ImplCommonAbstract."<init>":()V
   #72 = Utf8               api/Abstract
   #73 = Class              #72           // api/Abstract
   #74 = Utf8               callAbstract
   #75 = Utf8               (Lapi/Abstract;)V
   #76 = NameAndType        #74:#75       // callAbstract:(Lapi/Abstract;)V
   #77 = Methodref          #17.#76       // api/A.callAbstract:(Lapi/Abstract;)V
   #78 = Utf8               Lapi/V1;
   #79 = Utf8               $i$a$1$forVersion
   #80 = Utf8               I
   #81 = Utf8               v$iv
   #82 = Utf8               Ljava/lang/String;
   #83 = Utf8               $i$f$forVersion
   #84 = Utf8               Lapi/V2;
   #85 = Utf8               $i$a$2$forVersion
   #86 = Utf8               abstractImpl
   #87 = Utf8               Lour/ImplCommonAbstract;
   #88 = Utf8               ourA
   #89 = Utf8               Lapi/A;
   #90 = Utf8               [Ljava/lang/String;
   #91 = Utf8               java/lang/String
   #92 = Class              #91           // java/lang/String
   #93 = Utf8               Lkotlin/Metadata;
   #94 = Utf8               mv
   #95 = Integer            1
   #96 = Integer            9
   #97 = Utf8               bv
   #98 = Integer            0
   #99 = Integer            2
  #100 = Utf8               k
  #101 = Utf8               d1
  #102 = Utf8                \n \n\n \n\n\n 0200¢¨
  #103 = Utf8               d2
  #104 = Utf8
  #105 = Utf8               ourModule
  #106 = Utf8               OurCode.kt
  #107 = Utf8               Code
  #108 = Utf8               LocalVariableTable
  #109 = Utf8               LineNumberTable
  #110 = Utf8               StackMapTable
  #111 = Utf8               RuntimeInvisibleParameterAnnotations
  #112 = Utf8               SourceFile
  #113 = Utf8               SourceDebugExtension
  #114 = Utf8               RuntimeVisibleAnnotations
{
  public static final void main(java.lang.String[]);
    descriptor: ([Ljava/lang/String;)V
    flags: ACC_PUBLIC, ACC_STATIC, ACC_FINAL
    Code:
      stack=3, locals=7, args_size=1
         0: aload_0
         1: ldc           #9                  // String args
         3: invokestatic  #15                 // Method kotlin/jvm/internal/Intrinsics.checkParameterIsNotNull:(Ljava/lang/Object;Ljava/lang/String;)V
         6: new           #17                 // class api/A
         9: dup
        10: invokespecial #21                 // Method api/A."<init>":()V
        13: astore_1
        14: aload_1
        15: invokevirtual #24                 // Method api/A.same:()V
        18: ldc           #26                 // String 1
        20: astore_2
        21: getstatic     #32                 // Field compat/rt/VersionBox.INSTANCE:Lcompat/rt/VersionBox;
        24: aload_2
        25: invokevirtual #36                 // Method compat/rt/VersionBox.accepts:(Ljava/lang/String;)Z
        28: ifeq          64
        31: aload_1
        32: invokevirtual #39                 // Method api/A.v1:()V
        35: aload_1
        36: iconst_1
        37: invokevirtual #43                 // Method api/A.paramDiff:(I)V
        40: new           #45                 // class api/V1
        43: dup
        44: invokespecial #46                 // Method api/V1."<init>":()V
        47: astore_3
        48: new           #48                 // class our/ClassForV1
        51: dup
        52: invokespecial #49                 // Method our/ClassForV1."<init>":()V
        55: astore        4
        57: nop
        58: getstatic     #54                 // Field kotlin/Unit.INSTANCE:Lkotlin/Unit;
        61: goto          65
        64: aconst_null
        65: dup
        66: ifnull        72
        69: goto          121
        72: pop
        73: ldc           #56                 // String 2
        75: astore_2
        76: getstatic     #32                 // Field compat/rt/VersionBox.INSTANCE:Lcompat/rt/VersionBox;
        79: aload_2
        80: invokevirtual #36                 // Method compat/rt/VersionBox.accepts:(Ljava/lang/String;)Z
        83: ifeq          120
        86: aload_1
        87: invokevirtual #59                 // Method api/A.v2:()V
        90: aload_1
        91: iconst_1
        92: iconst_2
        93: invokevirtual #62                 // Method api/A.paramDiff:(II)V
        96: new           #64                 // class api/V2
        99: dup
       100: invokespecial #65                 // Method api/V2."<init>":()V
       103: astore_3
       104: new           #67                 // class our/ClassForV2
       107: dup
       108: invokespecial #68                 // Method our/ClassForV2."<init>":()V
       111: astore        4
       113: nop
       114: getstatic     #54                 // Field kotlin/Unit.INSTANCE:Lkotlin/Unit;
       117: goto          121
       120: aconst_null
       121: pop
       122: new           #70                 // class our/ImplCommonAbstract
       125: dup
       126: invokespecial #71                 // Method our/ImplCommonAbstract."<init>":()V
       129: astore_2
       130: aload_1
       131: aload_2
       132: checkcast     #73                 // class api/Abstract
       135: invokevirtual #77                 // Method api/A.callAbstract:(Lapi/Abstract;)V
       138: return
      LocalVariableTable:
        Start  Length  Slot  Name   Signature
           48       9     3    v1   Lapi/V1;
           31      27     5 $i$a$1$forVersion   I
           21      44     2  v$iv   Ljava/lang/String;
           21      44     6 $i$f$forVersion   I
          104       9     3    v2   Lapi/V2;
           86      28     5 $i$a$2$forVersion   I
           76      45     2  v$iv   Ljava/lang/String;
           76      45     6 $i$f$forVersion   I
          130       9     2 abstractImpl   Lour/ImplCommonAbstract;
           14     125     1  ourA   Lapi/A;
            0     139     0  args   [Ljava/lang/String;
      LineNumberTable:
        line 43: 6
        line 45: 14
        line 47: 18
        line 62: 21
        line 48: 31
        line 49: 35
        line 50: 40
        line 51: 48
        line 52: 57
        line 52: 73
        line 63: 76
        line 53: 86
        line 54: 90
        line 55: 96
        line 56: 104
        line 57: 113
        line 59: 122
        line 60: 130
        line 61: 138
      StackMapTable: number_of_entries = 5
        frame_type = 253 /* append */
          offset_delta = 64
          locals = [ class api/A, class java/lang/String ]
        frame_type = 64 /* same_locals_1_stack_item */
          stack = [ class kotlin/Unit ]
        frame_type = 70 /* same_locals_1_stack_item */
          stack = [ class kotlin/Unit ]
        frame_type = 47 /* same */
        frame_type = 64 /* same_locals_1_stack_item */
          stack = [ class kotlin/Unit ]
    RuntimeInvisibleParameterAnnotations:
      0:
        0: #7()
}
SourceFile: "OurCode.kt"
SourceDebugExtension:
  SMAP
  OurCode.kt
  Kotlin
  *S Kotlin
  *F
  + 1 OurCode.kt
  our/OurCodeKt
  + 2 Scopes.kt
  compat/rt/ScopesKt
  *L
  1#1,61:1
  10#2:62
  10#2:63
  *E
  *S KotlinDebug
  *F
  + 1 OurCode.kt
  our/OurCodeKt
  *L
  47#1:62
  52#1:63
  *E
RuntimeVisibleAnnotations:
  0: #93(#94=[I#95,I#95,I#96],#97=[I#95,I#98,I#99],#100=I#99,#101=[s#102],#103=[s#5,s#104,s#8,s#104,s#104,s#6,s#105])
