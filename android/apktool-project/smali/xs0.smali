.class public final Lxs0;
.super Lia0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lys0;


# static fields
.field public static final APPLICATION_INFO_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Lxs0;

.field public static final GAUGE_METRIC_FIELD_NUMBER:I = 0x4

.field public static final NETWORK_REQUEST_METRIC_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Lss0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lss0;"
        }
    .end annotation
.end field

.field public static final TRACE_METRIC_FIELD_NUMBER:I = 0x2

.field public static final TRANSPORT_INFO_FIELD_NUMBER:I = 0x5


# instance fields
.field private applicationInfo_:Lw9;

.field private bitField0_:I

.field private gaugeMetric_:Laa0;

.field private networkRequestMetric_:Lop0;

.field private traceMetric_:Lld1;

.field private transportInfo_:Ltd1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lxs0;

    .line 2
    .line 3
    invoke-direct {v0}, Lia0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lxs0;->DEFAULT_INSTANCE:Lxs0;

    .line 7
    .line 8
    const-class v1, Lxs0;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lia0;->p(Ljava/lang/Class;Lia0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static t()Lws0;
    .locals 1

    .line 1
    sget-object v0, Lxs0;->DEFAULT_INSTANCE:Lxs0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lia0;->i()Lea0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lws0;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final a()Z
    .locals 0

    .line 1
    iget p0, p0, Lxs0;->bitField0_:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x8

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

.method public final b()Laa0;
    .locals 0

    .line 1
    iget-object p0, p0, Lxs0;->gaugeMetric_:Laa0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Laa0;->v()Laa0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final c()Z
    .locals 0

    .line 1
    iget p0, p0, Lxs0;->bitField0_:I

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

.method public final d()Lld1;
    .locals 0

    .line 1
    iget-object p0, p0, Lxs0;->traceMetric_:Lld1;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lld1;->z()Lld1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final e()Z
    .locals 0

    .line 1
    iget p0, p0, Lxs0;->bitField0_:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x4

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

.method public final f()Lop0;
    .locals 0

    .line 1
    iget-object p0, p0, Lxs0;->networkRequestMetric_:Lop0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lop0;->u()Lop0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final j(I)Ljava/lang/Object;
    .locals 6

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
    sget-object p0, Lxs0;->PARSER:Lss0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-class p1, Lxs0;

    .line 18
    .line 19
    monitor-enter p1

    .line 20
    :try_start_0
    sget-object p0, Lxs0;->PARSER:Lss0;

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
    sput-object p0, Lxs0;->PARSER:Lss0;

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
    sget-object p0, Lxs0;->DEFAULT_INSTANCE:Lxs0;

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_2
    new-instance p0, Lws0;

    .line 44
    .line 45
    sget-object p1, Lxs0;->DEFAULT_INSTANCE:Lxs0;

    .line 46
    .line 47
    invoke-direct {p0, p1}, Lea0;-><init>(Lia0;)V

    .line 48
    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_3
    new-instance p0, Lxs0;

    .line 52
    .line 53
    invoke-direct {p0}, Lia0;-><init>()V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_4
    const-string v0, "bitField0_"

    .line 58
    .line 59
    const-string v1, "applicationInfo_"

    .line 60
    .line 61
    const-string v2, "traceMetric_"

    .line 62
    .line 63
    const-string v3, "networkRequestMetric_"

    .line 64
    .line 65
    const-string v4, "gaugeMetric_"

    .line 66
    .line 67
    const-string v5, "transportInfo_"

    .line 68
    .line 69
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string p1, "\u0001\u0005\u0000\u0001\u0001\u0005\u0005\u0000\u0000\u0000\u0001\u1009\u0000\u0002\u1009\u0001\u0003\u1009\u0002\u0004\u1009\u0003\u0005\u1009\u0004"

    .line 74
    .line 75
    sget-object v0, Lxs0;->DEFAULT_INSTANCE:Lxs0;

    .line 76
    .line 77
    new-instance v1, Lox0;

    .line 78
    .line 79
    invoke-direct {v1, v0, p1, p0}, Lox0;-><init>(Lh0;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    return-object v1

    .line 83
    :pswitch_5
    return-object p1

    .line 84
    :pswitch_6
    const/4 p0, 0x1

    .line 85
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    return-object p0

    .line 90
    nop

    .line 91
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

.method public final r()Lw9;
    .locals 0

    .line 1
    iget-object p0, p0, Lxs0;->applicationInfo_:Lw9;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lw9;->s()Lw9;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public final s()Z
    .locals 1

    .line 1
    iget p0, p0, Lxs0;->bitField0_:I

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

.method public final u(Lw9;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lxs0;->applicationInfo_:Lw9;

    .line 2
    .line 3
    iget p1, p0, Lxs0;->bitField0_:I

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iput p1, p0, Lxs0;->bitField0_:I

    .line 8
    .line 9
    return-void
.end method

.method public final v(Laa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lxs0;->gaugeMetric_:Laa0;

    .line 2
    .line 3
    iget p1, p0, Lxs0;->bitField0_:I

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x8

    .line 6
    .line 7
    iput p1, p0, Lxs0;->bitField0_:I

    .line 8
    .line 9
    return-void
.end method

.method public final w(Lop0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lxs0;->networkRequestMetric_:Lop0;

    .line 2
    .line 3
    iget p1, p0, Lxs0;->bitField0_:I

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x4

    .line 6
    .line 7
    iput p1, p0, Lxs0;->bitField0_:I

    .line 8
    .line 9
    return-void
.end method

.method public final x(Lld1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lxs0;->traceMetric_:Lld1;

    .line 2
    .line 3
    iget p1, p0, Lxs0;->bitField0_:I

    .line 4
    .line 5
    or-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    iput p1, p0, Lxs0;->bitField0_:I

    .line 8
    .line 9
    return-void
.end method
