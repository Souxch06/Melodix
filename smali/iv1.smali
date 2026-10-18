.class public final Liv1;
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
    iput-object p2, p0, Liv1;->j:Ljd2;

    .line 5
    .line 6
    iput-object p1, p0, Liv1;->k:Lgw1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Liv1;->j:Ljd2;

    .line 2
    .line 3
    iget-boolean v1, v0, Ljd2;->d:Z

    .line 4
    .line 5
    iget-object v2, p0, Liv1;->k:Lgw1;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p0, v2, Lgw1;->m:Ljd2;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljd2;->o()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_0
    iget-object v1, v2, Lgw1;->l:Ljq;

    .line 16
    .line 17
    invoke-interface {v1, v0}, Ljq;->d(Ljd2;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0
    :try_end_0
    .catch Ld21; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    iget-object p0, p0, Liv1;->k:Lgw1;

    .line 22
    .line 23
    iget-object p0, p0, Lgw1;->m:Ljd2;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljd2;->l(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception v0

    .line 30
    goto :goto_0

    .line 31
    :catch_1
    move-exception v0

    .line 32
    goto :goto_1

    .line 33
    :goto_0
    iget-object p0, p0, Liv1;->k:Lgw1;

    .line 34
    .line 35
    iget-object p0, p0, Lgw1;->m:Ljd2;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :goto_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    instance-of v1, v1, Ljava/lang/Exception;

    .line 46
    .line 47
    iget-object p0, p0, Liv1;->k:Lgw1;

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Ljava/lang/Exception;

    .line 56
    .line 57
    iget-object p0, p0, Lgw1;->m:Ljd2;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p0, p0, Lgw1;->m:Ljd2;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ljd2;->n(Ljava/lang/Exception;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method
