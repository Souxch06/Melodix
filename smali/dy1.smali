.class public final Ldy1;
.super Lfl1;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lfy1;


# virtual methods
.method public final r(Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lfl1;->F()Landroid/os/Parcel;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lfl1;->H(Landroid/os/Parcel;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
