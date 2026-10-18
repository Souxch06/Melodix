.class public Lhg0;
.super Lng0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final l:Z


# direct methods
.method public constructor <init>()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lng0;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, v1}, Lng0;->D(Lng0;)V

    .line 7
    .line 8
    .line 9
    sget-object v2, Lja;->a:Lsun/misc/Unsafe;

    .line 10
    .line 11
    sget-wide v3, Lng0;->j:J

    .line 12
    .line 13
    invoke-virtual {v2, p0, v3, v4}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lbk;

    .line 18
    .line 19
    instance-of v5, v2, Lck;

    .line 20
    .line 21
    if-eqz v5, :cond_0

    .line 22
    .line 23
    check-cast v2, Lck;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move-object v2, v1

    .line 27
    :goto_0
    const/4 v5, 0x0

    .line 28
    if-eqz v2, :cond_3

    .line 29
    .line 30
    invoke-virtual {v2}, Ljg0;->k()Lng0;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    :goto_1
    invoke-virtual {v2}, Lng0;->x()Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-eqz v6, :cond_1

    .line 39
    .line 40
    goto :goto_3

    .line 41
    :cond_1
    sget-object v6, Lja;->a:Lsun/misc/Unsafe;

    .line 42
    .line 43
    invoke-virtual {v6, v2, v3, v4}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lbk;

    .line 48
    .line 49
    instance-of v6, v2, Lck;

    .line 50
    .line 51
    if-eqz v6, :cond_2

    .line 52
    .line 53
    check-cast v2, Lck;

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_2
    move-object v2, v1

    .line 57
    :goto_2
    if-eqz v2, :cond_3

    .line 58
    .line 59
    invoke-virtual {v2}, Ljg0;->k()Lng0;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    goto :goto_1

    .line 64
    :cond_3
    move v0, v5

    .line 65
    :goto_3
    iput-boolean v0, p0, Lhg0;->l:Z

    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public final x()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lhg0;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public final y()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
