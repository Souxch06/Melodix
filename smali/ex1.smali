.class public final Lex1;
.super Lwm1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final g:Landroid/os/IBinder;

.field public final synthetic h:Ljg;


# direct methods
.method public constructor <init>(Ljg;ILandroid/os/IBinder;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lex1;->h:Ljg;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2, p4}, Lwm1;-><init>(Ljg;ILandroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lex1;->g:Landroid/os/IBinder;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lex1;->g:Landroid/os/IBinder;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {v0}, Lbh;->h(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Landroid/os/IBinder;

    .line 9
    .line 10
    invoke-interface {v2}, Landroid/os/IBinder;->getInterfaceDescriptor()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v2
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    iget-object p0, p0, Lex1;->h:Ljg;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljg;->t()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ljg;->t()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    add-int/lit8 p0, p0, 0x22

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    add-int/2addr p0, v0

    .line 47
    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 48
    .line 49
    .line 50
    return v1

    .line 51
    :cond_0
    invoke-virtual {p0, v0}, Ljg;->m(Landroid/os/IBinder;)Landroid/os/IInterface;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    const/4 v2, 0x2

    .line 58
    const/4 v3, 0x4

    .line 59
    invoke-virtual {p0, v2, v3, v0}, Ljg;->w(IILandroid/os/IInterface;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_1

    .line 64
    .line 65
    const/4 v2, 0x3

    .line 66
    invoke-virtual {p0, v2, v3, v0}, Ljg;->w(IILandroid/os/IInterface;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    :cond_1
    const/4 v0, 0x0

    .line 73
    iput-object v0, p0, Ljg;->C:Loo;

    .line 74
    .line 75
    iget-object p0, p0, Ljg;->x:Lgg;

    .line 76
    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    invoke-interface {p0}, Lgg;->onConnected()V

    .line 80
    .line 81
    .line 82
    :cond_2
    const/4 p0, 0x1

    .line 83
    return p0

    .line 84
    :catch_0
    :cond_3
    return v1
.end method

.method public final b(Loo;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lex1;->h:Ljg;

    .line 2
    .line 3
    iget-object p0, p0, Ljg;->y:Lhg;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lhg;->b(Loo;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    return-void
.end method
