.class public final Lbt0;
.super Lia0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field private static final DEFAULT_INSTANCE:Lbt0;

.field private static volatile PARSER:Lss0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lss0;"
        }
    .end annotation
.end field

.field public static final SESSION_ID_FIELD_NUMBER:I = 0x1

.field public static final SESSION_VERBOSITY_FIELD_NUMBER:I = 0x2

.field private static final sessionVerbosity_converter_:Lhf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lhf0;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private sessionId_:Ljava/lang/String;

.field private sessionVerbosity_:Lgf0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lok0;

    .line 2
    .line 3
    const/16 v1, 0x12

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lok0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lbt0;->sessionVerbosity_converter_:Lhf0;

    .line 9
    .line 10
    new-instance v0, Lbt0;

    .line 11
    .line 12
    invoke-direct {v0}, Lbt0;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lbt0;->DEFAULT_INSTANCE:Lbt0;

    .line 16
    .line 17
    const-class v1, Lbt0;

    .line 18
    .line 19
    invoke-static {v1, v0}, Lia0;->p(Ljava/lang/Class;Lia0;)V

    .line 20
    .line 21
    .line 22
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
    iput-object v0, p0, Lbt0;->sessionId_:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Lye0;->m:Lye0;

    .line 9
    .line 10
    iput-object v0, p0, Lbt0;->sessionVerbosity_:Lgf0;

    .line 11
    .line 12
    return-void
.end method

.method public static u()Lat0;
    .locals 1

    .line 1
    sget-object v0, Lbt0;->DEFAULT_INSTANCE:Lbt0;

    .line 2
    .line 3
    invoke-virtual {v0}, Lia0;->i()Lea0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lat0;

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
    sget-object p0, Lbt0;->PARSER:Lss0;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const-class p1, Lbt0;

    .line 18
    .line 19
    monitor-enter p1

    .line 20
    :try_start_0
    sget-object p0, Lbt0;->PARSER:Lss0;

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
    sput-object p0, Lbt0;->PARSER:Lss0;

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
    sget-object p0, Lbt0;->DEFAULT_INSTANCE:Lbt0;

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_2
    new-instance p0, Lat0;

    .line 43
    .line 44
    sget-object p1, Lbt0;->DEFAULT_INSTANCE:Lbt0;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Lea0;-><init>(Lia0;)V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_3
    new-instance p0, Lbt0;

    .line 51
    .line 52
    invoke-direct {p0}, Lbt0;-><init>()V

    .line 53
    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_4
    const-string p0, "bitField0_"

    .line 57
    .line 58
    const-string p1, "sessionId_"

    .line 59
    .line 60
    const-string v0, "sessionVerbosity_"

    .line 61
    .line 62
    sget-object v1, Lok0;->q:Lok0;

    .line 63
    .line 64
    filled-new-array {p0, p1, v0, v1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "\u0001\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0001\u0000\u0001\u1008\u0000\u0002\u081e"

    .line 69
    .line 70
    sget-object v0, Lbt0;->DEFAULT_INSTANCE:Lbt0;

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

.method public final r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lbt0;->sessionVerbosity_:Lgf0;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lk0;

    .line 5
    .line 6
    iget-boolean v1, v1, Lk0;->j:Z

    .line 7
    .line 8
    if-nez v1, :cond_2

    .line 9
    .line 10
    check-cast v0, Lye0;

    .line 11
    .line 12
    iget v1, v0, Lye0;->l:I

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    const/16 v2, 0xa

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    mul-int/lit8 v2, v1, 0x2

    .line 20
    .line 21
    :goto_0
    if-lt v2, v1, :cond_1

    .line 22
    .line 23
    new-instance v1, Lye0;

    .line 24
    .line 25
    iget-object v3, v0, Lye0;->k:[I

    .line 26
    .line 27
    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([II)[I

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget v0, v0, Lye0;->l:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-direct {v1, v2, v0, v3}, Lye0;-><init>([IIZ)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lbt0;->sessionVerbosity_:Lgf0;

    .line 38
    .line 39
    move-object v0, v1

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 42
    .line 43
    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .line 44
    .line 45
    .line 46
    throw p0

    .line 47
    :cond_2
    :goto_1
    const/4 p0, 0x2

    .line 48
    invoke-static {p0}, Loq;->t(I)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    check-cast v0, Lye0;

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Lye0;->c(I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final s()I
    .locals 2

    .line 1
    iget-object p0, p0, Lbt0;->sessionVerbosity_:Lgf0;

    .line 2
    .line 3
    check-cast p0, Lye0;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lye0;->e(I)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    if-eq p0, v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x2

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v1

    .line 19
    :goto_0
    if-nez v0, :cond_2

    .line 20
    .line 21
    return v1

    .line 22
    :cond_2
    return v0
.end method

.method public final t()I
    .locals 0

    .line 1
    iget-object p0, p0, Lbt0;->sessionVerbosity_:Lgf0;

    .line 2
    .line 3
    check-cast p0, Lye0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lye0;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final v(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lbt0;->bitField0_:I

    .line 5
    .line 6
    or-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Lbt0;->bitField0_:I

    .line 9
    .line 10
    iput-object p1, p0, Lbt0;->sessionId_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method
