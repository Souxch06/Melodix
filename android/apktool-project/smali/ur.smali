.class public final Lur;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Lnm;


# direct methods
.method public constructor <init>(Lnm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lur;->a:Lnm;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Lgf;)V
    .locals 10

    .line 1
    iget-object p0, p0, Lur;->a:Lnm;

    .line 2
    .line 3
    iget-object p1, p1, Lgf;->a:Ljava/util/HashSet;

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/16 v1, 0xa

    .line 8
    .line 9
    invoke-static {p1, v1}, Ldl;->w(Ljava/lang/Iterable;I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lq11;

    .line 31
    .line 32
    move-object v2, v1

    .line 33
    check-cast v2, Lef;

    .line 34
    .line 35
    iget-object v4, v2, Lef;->b:Ljava/lang/String;

    .line 36
    .line 37
    check-cast v1, Lef;

    .line 38
    .line 39
    iget-object v5, v1, Lef;->d:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, v1, Lef;->e:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v7, v1, Lef;->c:Ljava/lang/String;

    .line 44
    .line 45
    iget-wide v8, v1, Lef;->f:J

    .line 46
    .line 47
    sget-object v1, Lr11;->a:Lpa0;

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    const/16 v3, 0x100

    .line 54
    .line 55
    if-le v1, v3, :cond_0

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    :cond_0
    move-object v6, v2

    .line 63
    new-instance v3, Lff;

    .line 64
    .line 65
    invoke-direct/range {v3 .. v9}, Lff;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    iget-object p1, p0, Lnm;->o:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p1, Lny0;

    .line 75
    .line 76
    monitor-enter p1

    .line 77
    :try_start_0
    iget-object v1, p0, Lnm;->o:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v1, Lny0;

    .line 80
    .line 81
    invoke-virtual {v1, v0}, Lny0;->u(Ljava/util/List;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_2

    .line 86
    .line 87
    monitor-exit p1

    .line 88
    return-void

    .line 89
    :catchall_0
    move-exception v0

    .line 90
    move-object p0, v0

    .line 91
    goto :goto_1

    .line 92
    :cond_2
    iget-object v0, p0, Lnm;->o:Ljava/lang/Object;

    .line 93
    .line 94
    check-cast v0, Lny0;

    .line 95
    .line 96
    invoke-virtual {v0}, Lny0;->r()Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v1, p0, Lnm;->k:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v1, Lc9;

    .line 103
    .line 104
    iget-object v1, v1, Lc9;->l:Ljava/lang/Object;

    .line 105
    .line 106
    check-cast v1, Lzs;

    .line 107
    .line 108
    new-instance v2, Lo6;

    .line 109
    .line 110
    const/16 v3, 0x12

    .line 111
    .line 112
    invoke-direct {v2, p0, v3, v0}, Lo6;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1, v2}, Lzs;->a(Ljava/lang/Runnable;)Ljd2;

    .line 116
    .line 117
    .line 118
    monitor-exit p1

    .line 119
    return-void

    .line 120
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    throw p0
.end method
