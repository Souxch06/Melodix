.class public final Lx90;
.super Lia0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CPU_CLOCK_RATE_KHZ_FIELD_NUMBER:I = 0x2

.field public static final CPU_PROCESSOR_COUNT_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lx90;

.field public static final DEVICE_RAM_SIZE_KB_FIELD_NUMBER:I = 0x3

.field public static final MAX_APP_JAVA_HEAP_MEMORY_KB_FIELD_NUMBER:I = 0x4

.field public static final MAX_ENCOURAGED_APP_JAVA_HEAP_MEMORY_KB_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Lss0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lss0;"
        }
    .end annotation
.end field

.field public static final PROCESS_NAME_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private cpuClockRateKhz_:I

.field private cpuProcessorCount_:I

.field private deviceRamSizeKb_:I

.field private maxAppJavaHeapMemoryKb_:I

.field private maxEncouragedAppJavaHeapMemoryKb_:I

.field private processName_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lx90;

    .line 2
    .line 3
    invoke-direct {v0}, Lx90;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lx90;->DEFAULT_INSTANCE:Lx90;

    .line 7
    .line 8
    const-class v1, Lx90;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lia0;->p(Ljava/lang/Class;Lia0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lia0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lx90;->processName_:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static r()Lx90;
    .locals 1

    .line 1
    sget-object v0, Lx90;->DEFAULT_INSTANCE:Lx90;

    .line 2
    .line 3
    return-object v0
.end method

.method public static t()Lw90;
    .locals 1

    .line 1
    sget-object v0, Lx90;->DEFAULT_INSTANCE:Lx90;

    .line 2
    .line 3
    invoke-virtual {v0}, Lia0;->i()Lea0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lw90;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final j(I)Ljava/lang/Object;
    .locals 7

    .line 1
    invoke-static {p1}, Loq;->t(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x0

    .line 6
    packed-switch p0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lo40;->c()V

    .line 10
    .line 11
    .line 12
    return-object p1

    .line 13
    :pswitch_0
    sget-object p0, Lx90;->PARSER:Lss0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-class p1, Lx90;

    .line 18
    .line 19
    monitor-enter p1

    .line 20
    :try_start_0
    sget-object p0, Lx90;->PARSER:Lss0;

    .line 21
    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    new-instance p0, Lga0;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    sput-object p0, Lx90;->PARSER:Lss0;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    move-object p0, v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit p1

    .line 36
    return-object p0

    .line 37
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0

    .line 39
    :cond_1
    return-object p0

    .line 40
    :pswitch_1
    sget-object p0, Lx90;->DEFAULT_INSTANCE:Lx90;

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_2
    new-instance p0, Lw90;

    .line 44
    .line 45
    sget-object p1, Lx90;->DEFAULT_INSTANCE:Lx90;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lea0;-><init>(Lia0;)V

    .line 48
    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_3
    new-instance p0, Lx90;

    .line 52
    .line 53
    invoke-direct {p0}, Lx90;-><init>()V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_4
    const-string v0, "bitField0_"

    .line 58
    .line 59
    const-string v1, "processName_"

    .line 60
    .line 61
    const-string v2, "cpuClockRateKhz_"

    .line 62
    .line 63
    const-string v3, "deviceRamSizeKb_"

    .line 64
    .line 65
    const-string v4, "maxAppJavaHeapMemoryKb_"

    .line 66
    .line 67
    const-string v5, "maxEncouragedAppJavaHeapMemoryKb_"

    .line 68
    .line 69
    const-string v6, "cpuProcessorCount_"

    .line 70
    .line 71
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "\u0001\u0006\u0000\u0001\u0001\u0006\u0006\u0000\u0000\u0000\u0001\u1008\u0000\u0002\u1004\u0001\u0003\u1004\u0003\u0004\u1004\u0004\u0005\u1004\u0005\u0006\u1004\u0002"

    .line 76
    .line 77
    sget-object v0, Lx90;->DEFAULT_INSTANCE:Lx90;

    .line 78
    .line 79
    new-instance v1, Lox0;

    .line 80
    .line 81
    invoke-direct {v1, v0, p1, p0}, Lox0;-><init>(Lh0;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    return-object v1

    .line 85
    :pswitch_5
    return-object p1

    .line 86
    :pswitch_6
    const/4 p0, 0x1

    .line 87
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    nop

    .line 93
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final s()Z
    .locals 0

    .line 1
    iget p0, p0, Lx90;->bitField0_:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x10

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final u(I)V
    .locals 1

    .line 1
    iget v0, p0, Lx90;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x8

    .line 4
    .line 5
    iput v0, p0, Lx90;->bitField0_:I

    .line 6
    .line 7
    iput p1, p0, Lx90;->deviceRamSizeKb_:I

    .line 8
    .line 9
    return-void
.end method

.method public final v(I)V
    .locals 1

    .line 1
    iget v0, p0, Lx90;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x10

    .line 4
    .line 5
    iput v0, p0, Lx90;->bitField0_:I

    .line 6
    .line 7
    iput p1, p0, Lx90;->maxAppJavaHeapMemoryKb_:I

    .line 8
    .line 9
    return-void
.end method

.method public final w(I)V
    .locals 1

    .line 1
    iget v0, p0, Lx90;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x20

    .line 4
    .line 5
    iput v0, p0, Lx90;->bitField0_:I

    .line 6
    .line 7
    iput p1, p0, Lx90;->maxEncouragedAppJavaHeapMemoryKb_:I

    .line 8
    .line 9
    return-void
.end method
