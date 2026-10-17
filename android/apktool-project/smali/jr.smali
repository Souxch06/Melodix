.class public final Ljr;
.super Lia0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CLIENT_TIME_US_FIELD_NUMBER:I = 0x1

.field private static final DEFAULT_INSTANCE:Ljr;

.field private static volatile PARSER:Lss0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lss0;"
        }
    .end annotation
.end field

.field public static final SYSTEM_TIME_US_FIELD_NUMBER:I = 0x3

.field public static final USER_TIME_US_FIELD_NUMBER:I = 0x2


# instance fields
.field private bitField0_:I

.field private clientTimeUs_:J

.field private systemTimeUs_:J

.field private userTimeUs_:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljr;

    .line 2
    .line 3
    invoke-direct {v0}, Lia0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ljr;->DEFAULT_INSTANCE:Ljr;

    .line 7
    .line 8
    const-class v1, Ljr;

    .line 9
    .line 10
    invoke-static {v1, v0}, Lia0;->p(Ljava/lang/Class;Lia0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static r()Lir;
    .locals 1

    .line 1
    sget-object v0, Ljr;->DEFAULT_INSTANCE:Ljr;

    .line 2
    .line 3
    invoke-virtual {v0}, Lia0;->i()Lea0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lir;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final j(I)Ljava/lang/Object;
    .locals 2

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
    sget-object p0, Ljr;->PARSER:Lss0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-class p1, Ljr;

    .line 18
    .line 19
    monitor-enter p1

    .line 20
    :try_start_0
    sget-object p0, Ljr;->PARSER:Lss0;

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
    sput-object p0, Ljr;->PARSER:Lss0;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    monitor-exit p1

    .line 35
    return-object p0

    .line 36
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0

    .line 38
    :cond_1
    return-object p0

    .line 39
    :pswitch_1
    sget-object p0, Ljr;->DEFAULT_INSTANCE:Ljr;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_2
    new-instance p0, Lir;

    .line 43
    .line 44
    sget-object p1, Ljr;->DEFAULT_INSTANCE:Ljr;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Lea0;-><init>(Lia0;)V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_3
    new-instance p0, Ljr;

    .line 51
    .line 52
    invoke-direct {p0}, Lia0;-><init>()V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_4
    const-string p0, "bitField0_"

    .line 57
    .line 58
    const-string p1, "clientTimeUs_"

    .line 59
    .line 60
    const-string v0, "userTimeUs_"

    .line 61
    .line 62
    const-string v1, "systemTimeUs_"

    .line 63
    .line 64
    filled-new-array {p0, p1, v0, v1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "\u0001\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u1002\u0000\u0002\u1002\u0001\u0003\u1002\u0002"

    .line 69
    .line 70
    sget-object v0, Ljr;->DEFAULT_INSTANCE:Ljr;

    .line 71
    .line 72
    new-instance v1, Lox0;

    .line 73
    .line 74
    invoke-direct {v1, v0, p1, p0}, Lox0;-><init>(Lh0;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    return-object v1

    .line 78
    :pswitch_5
    return-object p1

    .line 79
    :pswitch_6
    const/4 p0, 0x1

    .line 80
    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0

    .line 85
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

.method public final s(J)V
    .locals 1

    .line 1
    iget v0, p0, Ljr;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ljr;->bitField0_:I

    .line 6
    .line 7
    iput-wide p1, p0, Ljr;->clientTimeUs_:J

    .line 8
    .line 9
    return-void
.end method

.method public final t(J)V
    .locals 1

    .line 1
    iget v0, p0, Ljr;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    iput v0, p0, Ljr;->bitField0_:I

    .line 6
    .line 7
    iput-wide p1, p0, Ljr;->systemTimeUs_:J

    .line 8
    .line 9
    return-void
.end method

.method public final u(J)V
    .locals 1

    .line 1
    iget v0, p0, Ljr;->bitField0_:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x2

    .line 4
    .line 5
    iput v0, p0, Ljr;->bitField0_:I

    .line 6
    .line 7
    iput-wide p1, p0, Ljr;->userTimeUs_:J

    .line 8
    .line 9
    return-void
.end method
