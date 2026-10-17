.class public final Lyw1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljd2;

.field public final synthetic k:Lgw1;


# direct methods
.method public constructor <init>(Lgw1;Ljd2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lyw1;->j:Ljd2;

    .line 5
    .line 6
    iput-object p1, p0, Lyw1;->k:Lgw1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lyw1;->k:Lgw1;

    .line 2
    .line 3
    iget-object v1, v0, Lgw1;->m:Ljd2;

    .line 4
    .line 5
    :try_start_0
    iget-object v2, v0, Lgw1;->l:Ljq;

    .line 6
    .line 7
    iget-object p0, p0, Lyw1;->j:Ljd2;

    .line 8
    .line 9
    invoke-interface {v2, p0}, Ljq;->d(Ljd2;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljd2;
    :try_end_0
    .catch Ld21; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    new-instance p0, Ljava/lang/NullPointerException;

    .line 18
    .line 19
    const-string v1, "Continuation returned null"

    .line 20
    .line 21
    invoke-direct {p0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lgw1;->p(Ljava/lang/Exception;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    sget-object v1, Lmb1;->b:Lsx;

    .line 29
    .line 30
    invoke-virtual {p0, v1, v0}, Ljd2;->d(Ljava/util/concurrent/Executor;Lcs0;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v1, v0}, Ljd2;->c(Ljava/util/concurrent/Executor;Lyr0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1, v0}, Ljd2;->a(Ljava/util/concurrent/Executor;Lvr0;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_0

    .line 42
    :catch_1
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :goto_0
    invoke-virtual {v1, p0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    instance-of v0, v0, Ljava/lang/Exception;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Ljava/lang/Exception;

    .line 61
    .line 62
    invoke-virtual {v1, p0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-virtual {v1, p0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
