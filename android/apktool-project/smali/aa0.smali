.class public final Laa0;
.super Lia0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final ANDROID_MEMORY_READINGS_FIELD_NUMBER:I = 0x4

.field public static final CPU_METRIC_READINGS_FIELD_NUMBER:I = 0x2

.field private static final DEFAULT_INSTANCE:Laa0;

.field public static final GAUGE_METADATA_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Lss0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lss0;"
        }
    .end annotation
.end field

.field public static final SESSION_ID_FIELD_NUMBER:I = 0x1


# instance fields
.field private androidMemoryReadings_:Lif0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lif0;"
        }
    .end annotation
.end field

.field private bitField0_:I

.field private cpuMetricReadings_:Lif0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lif0;"
        }
    .end annotation
.end field

.field private gaugeMetadata_:Lx90;

.field private sessionId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Laa0;

    .line 2
    .line 3
    invoke-direct {v0}, Laa0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Laa0;->DEFAULT_INSTANCE:Laa0;

    .line 7
    .line 8
    const-class v1, Laa0;

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
    iput-object v0, p0, Laa0;->sessionId_:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Lew0;->m:Lew0;

    .line 9
    .line 10
    iput-object v0, p0, Laa0;->cpuMetricReadings_:Lif0;

    .line 11
    .line 12
    iput-object v0, p0, Laa0;->androidMemoryReadings_:Lif0;

    .line 13
    .line 14
    return-void
.end method

.method public static v()Laa0;
    .locals 1

    .line 1
    sget-object v0, Laa0;->DEFAULT_INSTANCE:Laa0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static z()Lz90;
    .locals 1

    .line 1
    sget-object v0, Laa0;->DEFAULT_INSTANCE:Laa0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lia0;->i()Lea0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lz90;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final A(Lx90;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Laa0;->gaugeMetadata_:Lx90;

    .line 5
    .line 6
    iget p1, p0, Laa0;->bitField0_:I

    .line 7
    .line 8
    or-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    iput p1, p0, Laa0;->bitField0_:I

    .line 11
    .line 12
    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Laa0;->bitField0_:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Laa0;->bitField0_:I

    .line 9
    .line 10
    iput-object p1, p0, Laa0;->sessionId_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

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
    sget-object p0, Laa0;->PARSER:Lss0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-class p1, Laa0;

    .line 18
    .line 19
    monitor-enter p1

    .line 20
    :try_start_0
    sget-object p0, Laa0;->PARSER:Lss0;

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
    sput-object p0, Laa0;->PARSER:Lss0;

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
    sget-object p0, Laa0;->DEFAULT_INSTANCE:Laa0;

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_2
    new-instance p0, Lz90;

    .line 44
    .line 45
    sget-object p1, Laa0;->DEFAULT_INSTANCE:Laa0;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lea0;-><init>(Lia0;)V

    .line 48
    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_3
    new-instance p0, Laa0;

    .line 52
    .line 53
    invoke-direct {p0}, Laa0;-><init>()V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_4
    const-string v0, "bitField0_"

    .line 58
    .line 59
    const-string v1, "sessionId_"

    .line 60
    .line 61
    const-string v2, "cpuMetricReadings_"

    .line 62
    .line 63
    const-class v3, Ljr;

    .line 64
    .line 65
    const-string v4, "gaugeMetadata_"

    .line 66
    .line 67
    const-string v5, "androidMemoryReadings_"

    .line 68
    .line 69
    const-class v6, Li5;

    .line 70
    .line 71
    filled-new-array/range {v0 .. v6}, [Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string p1, "\u0001\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0002\u0000\u0001\u1008\u0000\u0002\u001b\u0003\u1009\u0001\u0004\u001b"

    .line 76
    .line 77
    sget-object v0, Laa0;->DEFAULT_INSTANCE:Laa0;

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

.method public final r(Li5;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Laa0;->androidMemoryReadings_:Lif0;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Lk0;

    .line 8
    .line 9
    iget-boolean v1, v1, Lk0;->j:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Lia0;->o(Lif0;)Lif0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Laa0;->androidMemoryReadings_:Lif0;

    .line 18
    .line 19
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final s(Ljr;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Laa0;->cpuMetricReadings_:Lif0;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Lk0;

    .line 8
    .line 9
    iget-boolean v1, v1, Lk0;->j:Z

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {v0}, Lia0;->o(Lif0;)Lif0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Laa0;->cpuMetricReadings_:Lif0;

    .line 18
    .line 19
    :cond_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final t()I
    .locals 0

    .line 1
    iget-object p0, p0, Laa0;->androidMemoryReadings_:Lif0;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final u()I
    .locals 0

    .line 1
    iget-object p0, p0, Laa0;->cpuMetricReadings_:Lif0;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final w()Lx90;
    .locals 0

    .line 1
    iget-object p0, p0, Laa0;->gaugeMetadata_:Lx90;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lx90;->r()Lx90;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final x()Z
    .locals 0

    .line 1
    iget p0, p0, Laa0;->bitField0_:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x2

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

.method public final y()Z
    .locals 1

    .line 1
    iget p0, p0, Laa0;->bitField0_:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    and-int/2addr p0, v0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method
