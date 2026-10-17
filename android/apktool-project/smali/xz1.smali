.class public final Lxz1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lav1;

.field public final synthetic k:Lyz1;


# direct methods
.method public constructor <init>(Lyz1;Lav1;Lyz1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lxz1;->j:Lav1;

    .line 5
    .line 6
    iput-object p1, p0, Lxz1;->k:Lyz1;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lxz1;->k:Lyz1;

    .line 2
    .line 3
    iget-object v1, v0, Lyz1;->k:Lzz1;

    .line 4
    .line 5
    iget-object v1, v1, Lzz1;->k:Ly02;

    .line 6
    .line 7
    iget-object v2, v1, Ly02;->p:Ls02;

    .line 8
    .line 9
    invoke-static {v2}, Ly02;->l(Lm22;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2}, Ls02;->l()V

    .line 13
    .line 14
    .line 15
    new-instance v2, Landroid/os/Bundle;

    .line 16
    .line 17
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v3, "package_name"

    .line 21
    .line 22
    iget-object v0, v0, Lyz1;->j:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v2, v3, v0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lxz1;->j:Lav1;

    .line 28
    .line 29
    :try_start_0
    check-cast p0, Lyu1;

    .line 30
    .line 31
    invoke-virtual {p0}, Lfl1;->F()Landroid/os/Parcel;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0, v2}, Lwu1;->b(Landroid/os/Parcel;Landroid/os/Parcelable;)V

    .line 36
    .line 37
    .line 38
    const/4 v2, 0x1

    .line 39
    invoke-virtual {p0, v0, v2}, Lfl1;->b(Landroid/os/Parcel;I)Landroid/os/Parcel;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object v0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 44
    .line 45
    invoke-static {p0, v0}, Lwu1;->a(Landroid/os/Parcel;Landroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Landroid/os/Bundle;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/os/Parcel;->recycle()V

    .line 52
    .line 53
    .line 54
    if-nez v0, :cond_0

    .line 55
    .line 56
    iget-object p0, v1, Ly02;->o:Lzy1;

    .line 57
    .line 58
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lzy1;->o:Lso;

    .line 62
    .line 63
    const-string v0, "Install Referrer Service returned a null response"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lso;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catch_0
    move-exception p0

    .line 70
    iget-object v0, v1, Ly02;->o:Lzy1;

    .line 71
    .line 72
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 76
    .line 77
    const-string v2, "Exception occurred while retrieving the Install Referrer"

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v0, p0, v2}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    :goto_0
    iget-object p0, v1, Ly02;->p:Ls02;

    .line 87
    .line 88
    invoke-static {p0}, Ly02;->l(Lm22;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ls02;->l()V

    .line 92
    .line 93
    .line 94
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 95
    .line 96
    const-string v0, "Unexpected call on client side"

    .line 97
    .line 98
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    throw p0
.end method
