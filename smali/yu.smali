.class public final Lyu;
.super Ljava/lang/ThreadLocal;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    iput p1, p0, Lyu;->a:I

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final initialValue()Ljava/lang/Object;
    .locals 3

    .line 1
    iget p0, p0, Lyu;->a:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    packed-switch p0, :pswitch_data_0

    .line 5
    .line 6
    .line 7
    new-instance p0, Ljava/util/Random;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_0
    new-instance p0, Ltd2;

    .line 14
    .line 15
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Lfe1;->I(Ljava/lang/Thread;)Z

    .line 20
    .line 21
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-boolean v0, p0, Ltd2;->a:Z

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ltd2;->b:Led2;

    .line 29
    .line 30
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget-object v1, Lhd2;->c:Ljava/util/WeakHashMap;

    .line 35
    .line 36
    monitor-enter v1

    .line 37
    :try_start_0
    invoke-virtual {v1, v0, p0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    monitor-exit v1

    .line 41
    return-object p0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0

    .line 45
    :pswitch_1
    const-wide/16 v0, 0x0

    .line 46
    .line 47
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :pswitch_2
    new-instance p0, Lho1;

    .line 53
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    .line 56
    .line 57
    iput v0, p0, Lho1;->j:I

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_3
    new-instance p0, Ljava/util/Random;

    .line 61
    .line 62
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_4
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 67
    .line 68
    const-string v1, "EEE, dd MMM yyyy HH:mm:ss \'GMT\'"

    .line 69
    .line 70
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 71
    .line 72
    invoke-direct {p0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->setLenient(Z)V

    .line 76
    .line 77
    .line 78
    sget-object v0, Ljg1;->d:Ljava/util/TimeZone;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 81
    .line 82
    .line 83
    return-object p0

    .line 84
    nop

    .line 85
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
