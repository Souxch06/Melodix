.class public final Lmw1;
.super Ls0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lmw1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final j:I

.field public final k:Ljava/lang/String;

.field public final l:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lom1;

    .line 2
    .line 3
    const/16 v1, 0xd

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lom1;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lmw1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lmw1;->j:I

    .line 5
    .line 6
    iput-object p2, p0, Lmw1;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lmw1;->l:Landroid/content/Intent;

    .line 9
    .line 10
    return-void
.end method

.method public static b(Landroid/app/Activity;)Lmw1;
    .locals 3

    .line 1
    new-instance v0, Lmw1;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, v1, v2, p0}, Lmw1;-><init>(ILjava/lang/String;Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lmw1;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lmw1;

    .line 12
    .line 13
    iget v1, p0, Lmw1;->j:I

    .line 14
    .line 15
    iget v3, p1, Lmw1;->j:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lmw1;->k:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lmw1;->k:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object p0, p0, Lmw1;->l:Landroid/content/Intent;

    .line 30
    .line 31
    iget-object p1, p1, Lmw1;->l:Landroid/content/Intent;

    .line 32
    .line 33
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    return v2
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lmw1;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    .line 1
    const/16 v0, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, v0}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x4

    .line 9
    invoke-static {p1, v1, v2}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 10
    .line 11
    .line 12
    iget v1, p0, Lmw1;->j:I

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    iget-object v2, p0, Lmw1;->k:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p1, v1, v2}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x3

    .line 24
    iget-object p0, p0, Lmw1;->l:Landroid/content/Intent;

    .line 25
    .line 26
    invoke-static {p1, v1, p0, p2}, Lbe2;->E(Landroid/os/Parcel;ILandroid/os/Parcelable;I)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, v0}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
