.class public final synthetic Lbn;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljq;


# instance fields
.field public final synthetic j:Ldn;

.field public final synthetic k:Ljd2;

.field public final synthetic l:Ljd2;

.field public final synthetic m:Ljava/util/Date;

.field public final synthetic n:Ljava/util/HashMap;


# direct methods
.method public synthetic constructor <init>(Ldn;Ljd2;Ljd2;Ljava/util/Date;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lbn;->j:Ldn;

    .line 5
    .line 6
    iput-object p2, p0, Lbn;->k:Ljd2;

    .line 7
    .line 8
    iput-object p3, p0, Lbn;->l:Ljd2;

    .line 9
    .line 10
    iput-object p4, p0, Lbn;->m:Ljava/util/Date;

    .line 11
    .line 12
    iput-object p5, p0, Lbn;->n:Ljava/util/HashMap;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final d(Ljd2;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object p1, p0, Lbn;->j:Ldn;

    .line 2
    .line 3
    iget-object v0, p0, Lbn;->m:Ljava/util/Date;

    .line 4
    .line 5
    iget-object v1, p0, Lbn;->n:Ljava/util/HashMap;

    .line 6
    .line 7
    iget-object v2, p0, Lbn;->k:Ljd2;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljd2;->j()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    new-instance p0, Lw40;

    .line 16
    .line 17
    const-string p1, "Firebase Installations failed to get installation ID for fetch."

    .line 18
    .line 19
    invoke-virtual {v2}, Ljd2;->g()Ljava/lang/Exception;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {p0, p1, v0}, Lx30;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Lbe2;->k(Lx40;)Ljd2;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object p0, p0, Lbn;->l:Ljd2;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljd2;->j()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-nez v3, :cond_1

    .line 38
    .line 39
    new-instance p1, Lw40;

    .line 40
    .line 41
    const-string v0, "Firebase Installations failed to get installation auth token for fetch."

    .line 42
    .line 43
    invoke-virtual {p0}, Ljd2;->g()Ljava/lang/Exception;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {p1, v0, p0}, Lx30;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p1}, Lbe2;->k(Lx40;)Ljd2;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_1
    invoke-virtual {v2}, Ljd2;->h()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljd2;->h()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Lte;

    .line 66
    .line 67
    iget-object p0, p0, Lte;->a:Ljava/lang/String;

    .line 68
    .line 69
    :try_start_0
    invoke-virtual {p1, v2, p0, v0, v1}, Ldn;->b(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/HashMap;)Lcn;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iget v0, p0, Lcn;->a:I

    .line 74
    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    invoke-static {p0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_2
    iget-object v0, p1, Ldn;->e:Ljava/lang/Object;

    .line 83
    .line 84
    check-cast v0, Lxm;

    .line 85
    .line 86
    iget-object v1, p0, Lcn;->b:Lzm;

    .line 87
    .line 88
    iget-object v2, v0, Lxm;->a:Ljava/util/concurrent/Executor;

    .line 89
    .line 90
    new-instance v3, Lwm;

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    invoke-direct {v3, v0, v4, v1}, Lwm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v2, v3}, Lbe2;->c(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Ljd2;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    new-instance v4, Lkm;

    .line 101
    .line 102
    const/4 v5, 0x1

    .line 103
    invoke-direct {v4, v0, v5, v1}, Lkm;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v2, v4}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object p1, p1, Ldn;->c:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast p1, Ljava/util/concurrent/Executor;

    .line 113
    .line 114
    new-instance v1, Lfj;

    .line 115
    .line 116
    invoke-direct {v1, v5, p0}, Lfj;-><init>(ILjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0, p1, v1}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 120
    .line 121
    .line 122
    move-result-object p0
    :try_end_0
    .catch Lx40; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    return-object p0

    .line 124
    :catch_0
    move-exception p0

    .line 125
    invoke-static {p0}, Lbe2;->k(Lx40;)Ljd2;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0
.end method
