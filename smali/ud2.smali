.class public final Lud2;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lhz0;

.field public final synthetic k:Led2;

.field public final synthetic l:Lt52;


# direct methods
.method public constructor <init>(Lhz0;Led2;Lt52;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lud2;->j:Lhz0;

    .line 5
    .line 6
    iput-object p2, p0, Lud2;->k:Led2;

    .line 7
    .line 8
    iput-object p3, p0, Lud2;->l:Lt52;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lud2;->j:Lhz0;

    .line 2
    .line 3
    iget-object v0, v0, Lhz0;->j:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lud2;->l:Lt52;

    .line 8
    .line 9
    invoke-static {}, Lhd2;->c()Ltd2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Lud2;->k:Led2;

    .line 14
    .line 15
    invoke-static {v1, p0}, Lhd2;->b(Ltd2;Led2;)Led2;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :try_start_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    .line 21
    .line 22
    invoke-static {v1, p0}, Lhd2;->b(Ltd2;Led2;)Led2;

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    :try_start_1
    invoke-static {v0}, Lgd2;->a(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 31
    :catchall_1
    move-exception v0

    .line 32
    invoke-static {v1, p0}, Lhd2;->b(Ltd2;Led2;)Led2;

    .line 33
    .line 34
    .line 35
    throw v0

    .line 36
    :cond_0
    invoke-static {}, Lz0;->a()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object p0, p0, Lud2;->l:Lt52;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    add-int/lit8 v0, v0, 0xe

    .line 14
    .line 15
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 16
    .line 17
    .line 18
    const-string v0, "propagating=["

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, "]"

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method
