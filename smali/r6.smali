.class public final Lr6;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lg7;


# direct methods
.method public constructor <init>(Lg7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lr6;->j:Lg7;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object p0, p0, Lr6;->j:Lg7;

    .line 2
    .line 3
    iget v0, p0, Lg7;->i0:I

    .line 4
    .line 5
    and-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lg7;->t(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lg7;->i0:I

    .line 14
    .line 15
    and-int/lit16 v0, v0, 0x1000

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x6c

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lg7;->t(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iput-boolean v1, p0, Lg7;->h0:Z

    .line 25
    .line 26
    iput v1, p0, Lg7;->i0:I

    .line 27
    .line 28
    return-void
.end method
