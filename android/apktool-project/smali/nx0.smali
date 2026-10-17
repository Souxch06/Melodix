.class public final Lnx0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lkn;

.field public final b:D

.field public final c:D

.field public final d:Lmx0;

.field public final e:Lmx0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Llx0;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    new-instance v2, Lmz;

    .line 6
    .line 7
    const/16 v3, 0xb

    .line 8
    .line 9
    invoke-direct {v2, v3}, Lmz;-><init>(I)V

    .line 10
    .line 11
    .line 12
    new-instance v3, Ljava/util/Random;

    .line 13
    .line 14
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/util/Random;->nextDouble()D

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    new-instance v5, Ljava/util/Random;

    .line 22
    .line 23
    invoke-direct {v5}, Ljava/util/Random;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v5}, Ljava/util/Random;->nextDouble()D

    .line 27
    .line 28
    .line 29
    move-result-wide v5

    .line 30
    invoke-static {}, Lkn;->e()Lkn;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 35
    .line 36
    .line 37
    const/4 v8, 0x0

    .line 38
    iput-object v8, v0, Lnx0;->d:Lmx0;

    .line 39
    .line 40
    iput-object v8, v0, Lnx0;->e:Lmx0;

    .line 41
    .line 42
    const-wide/16 v9, 0x0

    .line 43
    .line 44
    cmpg-double v11, v9, v3

    .line 45
    .line 46
    const/4 v12, 0x0

    .line 47
    const/4 v13, 0x1

    .line 48
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    .line 49
    .line 50
    if-gtz v11, :cond_0

    .line 51
    .line 52
    cmpg-double v11, v3, v14

    .line 53
    .line 54
    if-gez v11, :cond_0

    .line 55
    .line 56
    move v11, v13

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    move v11, v12

    .line 59
    :goto_0
    if-eqz v11, :cond_3

    .line 60
    .line 61
    cmpg-double v9, v9, v5

    .line 62
    .line 63
    if-gtz v9, :cond_1

    .line 64
    .line 65
    cmpg-double v9, v5, v14

    .line 66
    .line 67
    if-gez v9, :cond_1

    .line 68
    .line 69
    move v12, v13

    .line 70
    :cond_1
    if-eqz v12, :cond_2

    .line 71
    .line 72
    iput-wide v3, v0, Lnx0;->b:D

    .line 73
    .line 74
    iput-wide v5, v0, Lnx0;->c:D

    .line 75
    .line 76
    iput-object v7, v0, Lnx0;->a:Lkn;

    .line 77
    .line 78
    new-instance v3, Lmx0;

    .line 79
    .line 80
    const-string v4, "Trace"

    .line 81
    .line 82
    invoke-direct {v3, v1, v2, v7, v4}, Lmx0;-><init>(Llx0;Lmz;Lkn;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iput-object v3, v0, Lnx0;->d:Lmx0;

    .line 86
    .line 87
    new-instance v3, Lmx0;

    .line 88
    .line 89
    const-string v4, "Network"

    .line 90
    .line 91
    invoke-direct {v3, v1, v2, v7, v4}, Lmx0;-><init>(Llx0;Lmz;Lkn;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iput-object v3, v0, Lnx0;->e:Lmx0;

    .line 95
    .line 96
    invoke-static/range {p1 .. p1}, Lml;->s(Landroid/content/Context;)Z

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    const-string v0, "Fragment sampling bucket ID should be in range [0.0, 1.0)."

    .line 101
    .line 102
    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    throw v8

    .line 106
    :cond_3
    const-string v0, "Sampling bucket ID should be in range [0.0, 1.0)."

    .line 107
    .line 108
    invoke-static {v0}, Lz0;->d(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw v8
.end method

.method public static a(Lif0;)Z
    .locals 2

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lbt0;

    .line 13
    .line 14
    invoke-virtual {v0}, Lbt0;->t()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lbt0;

    .line 25
    .line 26
    invoke-virtual {p0}, Lbt0;->s()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    const/4 v0, 0x2

    .line 31
    if-ne p0, v0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    return v1
.end method
