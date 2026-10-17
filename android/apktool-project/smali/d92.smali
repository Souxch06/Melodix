.class public final Ld92;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljd2;

.field public final synthetic k:Lkz1;


# direct methods
.method public constructor <init>(Lkz1;Ljd2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ld92;->j:Ljd2;

    .line 5
    .line 6
    iput-object p1, p0, Ld92;->k:Lkz1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ld92;->k:Lkz1;

    .line 2
    .line 3
    iget-object v1, v0, Lkz1;->m:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljd2;

    .line 6
    .line 7
    :try_start_0
    iget-object v2, v0, Lkz1;->l:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v2, Lpa1;

    .line 10
    .line 11
    iget-object p0, p0, Ld92;->j:Ljd2;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljd2;->h()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {v2, p0}, Lpa1;->o(Ljava/lang/Object;)Ljd2;

    .line 18
    .line 19
    .line 20
    move-result-object p0
    :try_end_0
    .catch Ld21; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    sget-object v1, Lmb1;->b:Lsx;

    .line 22
    .line 23
    invoke-virtual {p0, v1, v0}, Ljd2;->d(Ljava/util/concurrent/Executor;Lcs0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v1, v0}, Ljd2;->c(Ljava/util/concurrent/Executor;Lyr0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v1, v0}, Ljd2;->a(Ljava/util/concurrent/Executor;Lvr0;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    goto :goto_0

    .line 35
    :catch_1
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :goto_0
    invoke-virtual {v1, p0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_2
    invoke-virtual {v0}, Lkz1;->g()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    instance-of v2, v2, Ljava/lang/Exception;

    .line 50
    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Ljava/lang/Exception;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Lkz1;->p(Ljava/lang/Exception;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    invoke-virtual {v1, p0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
