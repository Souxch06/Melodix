.class public final Lw10;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lw10;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lw10;->a:I

    .line 7
    .line 8
    const/4 p1, 0x3

    .line 9
    iput p1, p0, Lw10;->c:I

    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    iput p1, p0, Lw10;->d:I

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lw10;->b:Ljava/lang/String;

    .line 17
    iput p2, p0, Lw10;->a:I

    .line 18
    iput p3, p0, Lw10;->c:I

    const/4 p1, -0x1

    .line 19
    iput p1, p0, Lw10;->d:I

    return-void
.end method
