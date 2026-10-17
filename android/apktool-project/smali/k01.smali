.class public final Lk01;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final j:Lzc;

.field public final k:Llb1;

.field public final synthetic l:Ll01;


# direct methods
.method public constructor <init>(Ll01;Lzc;Llb1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lk01;->l:Ll01;

    .line 5
    .line 6
    iput-object p2, p0, Lk01;->j:Lzc;

    .line 7
    .line 8
    iput-object p3, p0, Lk01;->k:Llb1;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lk01;->j:Lzc;

    .line 2
    .line 3
    iget-object v1, p0, Lk01;->k:Llb1;

    .line 4
    .line 5
    iget-object p0, p0, Lk01;->l:Ll01;

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1}, Ll01;->b(Lzc;Llb1;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll01;->i:Lxn0;

    .line 11
    .line 12
    iget-object v0, v0, Lxn0;->l:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 18
    .line 19
    .line 20
    const-wide v0, 0x40ed4c0000000000L    # 60000.0

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    iget-wide v2, p0, Ll01;->a:D

    .line 26
    .line 27
    div-double/2addr v0, v2

    .line 28
    iget-wide v2, p0, Ll01;->b:D

    .line 29
    .line 30
    invoke-virtual {p0}, Ll01;->a()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    int-to-double v4, p0

    .line 35
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    .line 36
    .line 37
    .line 38
    move-result-wide v2

    .line 39
    mul-double/2addr v2, v0

    .line 40
    const-wide v0, 0x414b774000000000L    # 3600000.0

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(DD)D

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 50
    .line 51
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    div-double v2, v0, v2

    .line 57
    .line 58
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-string v3, "%.2f"

    .line 67
    .line 68
    invoke-static {p0, v3, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    double-to-long v0, v0

    .line 72
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    :catch_0
    return-void
.end method
