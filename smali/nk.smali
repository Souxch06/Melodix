.class public final Lnk;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final synthetic e:I


# instance fields
.field public final a:Llc1;

.field public final b:Ljava/util/List;

.field public final c:Lqa0;

.field public final d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Llc1;Ljava/util/List;Lqa0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lnk;->a:Llc1;

    .line 5
    .line 6
    iput-object p2, p0, Lnk;->b:Ljava/util/List;

    .line 7
    .line 8
    iput-object p3, p0, Lnk;->c:Lqa0;

    .line 9
    .line 10
    iput-object p4, p0, Lnk;->d:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method
