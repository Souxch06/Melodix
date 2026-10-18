.class public final Lwg;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lbv1;


# direct methods
.method public constructor <init>(Lbv1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lwg;->j:Lbv1;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object p0, p0, Lwg;->j:Lbv1;

    .line 2
    .line 3
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 6
    .line 7
    iget v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->u:I

    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method
