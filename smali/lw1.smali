.class public final Llw1;
.super Ls0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Llw1;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final j:J

.field public final k:J

.field public final l:Z

.field public final m:Landroid/os/Bundle;

.field public final n:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lom1;

    .line 2
    .line 3
    const/16 v1, 0xc

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lom1;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Llw1;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(JJZLandroid/os/Bundle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Llw1;->j:J

    .line 5
    .line 6
    iput-wide p3, p0, Llw1;->k:J

    .line 7
    .line 8
    iput-boolean p5, p0, Llw1;->l:Z

    .line 9
    .line 10
    iput-object p6, p0, Llw1;->m:Landroid/os/Bundle;

    .line 11
    .line 12
    iput-object p7, p0, Llw1;->n:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    .line 1
    const/16 p2, 0x4f45

    .line 2
    .line 3
    invoke-static {p1, p2}, Lbe2;->L(Landroid/os/Parcel;I)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    const/4 v0, 0x1

    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-static {p1, v0, v1}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 11
    .line 12
    .line 13
    iget-wide v2, p0, Llw1;->j:J

    .line 14
    .line 15
    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-static {p1, v0, v1}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 20
    .line 21
    .line 22
    iget-wide v2, p0, Llw1;->k:J

    .line 23
    .line 24
    invoke-virtual {p1, v2, v3}, Landroid/os/Parcel;->writeLong(J)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    const/4 v2, 0x3

    .line 29
    invoke-static {p1, v2, v0}, Lbe2;->J(Landroid/os/Parcel;II)V

    .line 30
    .line 31
    .line 32
    iget-boolean v0, p0, Llw1;->l:Z

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x7

    .line 38
    iget-object v2, p0, Llw1;->m:Landroid/os/Bundle;

    .line 39
    .line 40
    invoke-static {p1, v0, v2}, Lbe2;->z(Landroid/os/Parcel;ILandroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Llw1;->n:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v1, p0}, Lbe2;->F(Landroid/os/Parcel;ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, p2}, Lbe2;->N(Landroid/os/Parcel;I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
